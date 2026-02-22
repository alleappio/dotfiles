#!/bin/env python
import os
import math
import subprocess

import re
from typing import List


rofi_command = ["rofi", "-theme", "~/.config/rofi/generic_list/theme.rasi",
        "-config", "~/.config/rofi/config.rasi",
        "-dmenu"
    ]

rofi_command_password = ["rofi", "-theme",  "~/.config/rofi/generic_input/theme.rasi",
        "-config", "~/.config/rofi/config.rasi",
        "-dmenu",
        "-password",
        "-p", "Password"
    ]

class AccessPoint:
    """
    Represents a single access point from `nmcli device wifi list`.
    The constructor parses a single line using column positions.
    """

    # Column positions are computed once from the header
    _col_positions = None

    def __init__(self, line: str):
        if AccessPoint._col_positions is None:
            raise ValueError("Column positions not initialized. Call parse_output() first.")

        fields = []
        for i in range(len(self._col_positions) - 1):
            start = self._col_positions[i]
            end = self._col_positions[i + 1]
            fields.append(line[start:end].strip())

        while len(fields) < 8:
            fields.append("")

        self.in_use = fields[0] == "*"
        self.bssid = fields[1]
        self.ssid = fields[2]
        frequency_int = fields[3].replace(" MHz","")
        frequency_int = int(frequency_int) if frequency_int.isdigit() else 0
        self.signal = int(fields[4]) if fields[4].isdigit() else 0
        self.security = fields[5]

        if frequency_int > 6000:
            self.frequency = "6G"
        elif frequency_int > 5000 and frequency_int<6000:
            self.frequency = "5G"
        elif frequency_int > 2000 and frequency_int<5000:
            self.frequency = "2.4G"
        else:
            self.frequency = ""

    def __repr__(self):
        return (
            f"AccessPoint(ssid='{self.ssid}({self.frequency})', signal={self.signal}, "
            f"security='{self.security}', in_use={self.in_use})"
        )

    @classmethod
    def parse_output(cls, output: str) -> List["AccessPoint"]:
        """
        Parse full output of `nmcli device wifi list`
        and return a list of AccessPoint objects.
        """

        lines = output.strip().split("\n")
        if len(lines) <= 1:
            return []

        header = lines[0]

        # Detect column start positions from header
        cls._col_positions = [m.start() for m in re.finditer(r"\S+", header)]
        cls._col_positions.append(len(header))  # sentinel

        aps = []
        for line in lines[1:]:
            if line.strip():
                aps.append(cls(line))

        return aps

def notify(message):
    subprocess.Popen(
        ["notify-send", "-i", "network-wireless", "wifi menu", message],
        stdin=subprocess.PIPE,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        text=True
    )

def is_known_network(ssid):
    result = subprocess.run(
        ["nmcli", "-t", "-f", "NAME", "connection", "show"],
        capture_output=True, text=True
    )
    known = [line.strip() for line in result.stdout.splitlines()]
    return ssid in known

def disconnect(chosen_one):
    subprocess.run(
        [
            "nmcli",
            "connection",
            "down",
            chosen_one.ssid
        ]
    )

def connect_without_password(chosen_one):
    # Open network → no password needed
    try:
        subprocess.run(
            [
                "nmcli",
                "device",
                "wifi",
                "connect",
                chosen_one.ssid
            ],
            check=True
        )
    except subprocess.CalledProcessError:
        subprocess.run(
            ["nmcli", "connection", "delete", chosen_one.ssid],
        )
        connect_with_password(chosen_one)

def connect_with_password(chosen_one):
    rofi_password = subprocess.run(
        rofi_command_password,
        text = True,
        capture_output = True
    )


    password = rofi_password.stdout.strip()

    if not password:
        return  # user cancelled

    connect_to_wifi = subprocess.run(
        ["nmcli", "device", "wifi", "connect", chosen_one.ssid, "password", password]
    )

def strenght_icon(value):
    icons = ["", "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥"]
    index = math.ceil((value*len(icons))/100)
    return icons[index-1]

def call_rofi(access_points):
    stringified = ""
    for i in access_points:
        stringified+=f"{strenght_icon(i.signal)} {i.ssid} ({i.frequency})"
        if i.in_use:
            stringified+=" "
        stringified+="\n"
    remap_list=stringified.split("\n")

    rofi_subprocess = subprocess.run(
        rofi_command,
        input=stringified,
        text=True,
        capture_output=True
    )

    selected = rofi_subprocess.stdout.strip()

    if not selected:
        print("no network chosen")
        return  # user cancelled

    try:
        chosen_one = access_points[remap_list.index(selected)]
    except ValueError:
        notify(f"No network with SSID {selected} found")
        return


    try:
        if not chosen_one:
            return
        if chosen_one.in_use:
            disconnect(chosen_one)
        elif chosen_one.security in ("--", "", None) or is_known_network(chosen_one.ssid):
            connect_without_password(chosen_one)
        else:
            connect_with_password(chosen_one)
    except subprocess.CalledProcessError:
        notify(f"Could not connect to {chosen_one.ssid}")


def scan_with_feedback():
    """
    Scan for wifi networks while showing a rofi instance with feedback.
    """
    # Start rofi feedback in a separate thread
    notify("Scanning wifi networks")
    
    # Perform the actual scan
    listProcess = subprocess.run(
        ["nmcli", "-f", "IN-USE,BSSID,SSID,FREQ,SIGNAL,SECURITY", "-c", "no", "-m", "tabular", "device", "wifi", "list"],
        text=True,
        capture_output=True
    )
    
    # Close the rofi feedback
    return listProcess.stdout



def main():
    listProcess = scan_with_feedback()
    access_points = AccessPoint.parse_output(listProcess)
    call_rofi(access_points)

if __name__ == '__main__':
    main()

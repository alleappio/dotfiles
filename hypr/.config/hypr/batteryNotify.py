#!/usr/bin/env python3
import subprocess
import time
import re
import argparse


BATTERY = "BAT0"
THRESHOLD = 20 # %
CHECK_INTERVAL = 60 # seconds
NOTIFY_TIMEOUT = 10000 # ms


def get_parameters():
    parameters={}
    parser = argparse.ArgumentParser(prog='batteryNotify',
                                     description="A low battery notification demon")
    parser.add_argument('-b', '--battery', help='Battery device, use upower -b for info')
    parser.add_argument('-t', '--threshold', help='Low battery threshold')
    parser.add_argument('-ci', '--check_interval', help='Time between two checks')
    parser.add_argument('-nt', '--notify_timeout', help='Notification timeout')
    args = parser.parse_args()
    if args.battery:
        parameters["battery"] = args.battery
    else:
        parameters["battery"] = BATTERY

    if args.threshold:
        parameters["threshold"] = int(args.threshold)
    else:
        parameters["threshold"] = THRESHOLD

    if args.check_interval:
        parameters["check_interval"] = int(args.check_interval)
    else:
        parameters["check_interval"] = CHECK_INTERVAL

    if args.notify_timeout:
        parameters["notify_timeout"] = int(args.notify_timeout)
    else:
        parameters["notify_timeout"] = NOTIFY_TIMEOUT

    return parameters

def get_battery_percentage(parameters):
    try:
        out = subprocess.check_output(["upower", "-i", f"/org/freedesktop/UPower/devices/battery_{parameters["battery"]}"], text=True)
        match = re.search(r"percentage:\s+(\d+)%", out)
        if match:
            return int(match.group(1))
    except Exception as e:
        print(f"ERROR: {e}")

def send_notification(level, parameters):
    subprocess.run([
        "notify-send",
        "-u", "critical",
        "-t", str(parameters["notify_timeout"]),
        "LOW BATTERY",
        f"Battery level at {level}%"
    ])

def main():
    parameters = get_parameters()
    already_warned = False
    while True:
        level = get_battery_percentage(parameters)
        if level is not None:
            if level < parameters["threshold"] and not already_warned:
                send_notification(level, parameters)
                already_warned = True
            elif level > parameters["threshold"]:
                already_warned = False
        time.sleep(parameters["check_interval"])

if __name__ == '__main__':
    main()


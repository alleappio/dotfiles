#!/bin/python3
import psutil
import subprocess
import time

def send_notification(percent):
    subprocess.run(["notify-send", f"Battery low: {percent}%"], check=True)

while True:
    battery = psutil.sensors_battery()
    percent = int(battery.percent)
    print(percent)

    if percent <= 20 and not battery.power_plugged:
        send_notification(percent)

    time.sleep(60) # check every 60 seconds

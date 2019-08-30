#!/usr/bin/python3
#
# Utility for ltc1695 fan controller
# CC0 Koen De Vleeschauwer 2019
#
# to start up at boot, in /etc/rc.local add:
# /usr/local/bin/fanctl &
#

import os
import re
from time import sleep
import signal
import sys
import smbus

ltc1695_bus = 1
ltc1695_address = 0x74

fan_min = 21   # min fan speed
fan_boost = 25 # lowest speed where fan is guaranteed to start
fan_max = 63   # max fan speed

temp_min = 60  # min temperature
temp_max = 80  # max temperature

soft_start = True # soft or hard start
debug = False

# get cpu and video temperature

def get_cpu_temperature():
    tFile = open('/sys/class/thermal/thermal_zone0/temp')
    temp_millis = '00000' + tFile.read()
    temp = int(temp_millis[:-4])
    if debug:
        print ("cpu temp:", temp)
    return temp

def get_video_temperature():
    video_temp = os.popen("vcgencmd measure_temp").readline()
    temp = int(re.findall("\d+", video_temp + '0')[0])
    if debug:
        print ("video temp:", temp)
    return temp

# i2c write and read to fan controller

def get_fan():
    fan_status = bus.read_byte(ltc1695_address)
    if fan_status & 0x80:
        print("overcurrent")
    if fan_status & 0x40:
        print("thermal shutdown")
    return()

def set_fan(speed, boost):
    dta = int(speed)
    if not dta in range(0, 63):
        return()
    if boost:
        dta += 64;
    bus.write_byte(ltc1695_address, dta)
    return()

# set fan speed
# to avoid stalling at low speeds, if the fan speed is less than or equal to fan_boost
# the fan will run at full speed for a quarter of a second, and then continue at the programmed speed ("boost")

def set_fan_speed(speed):
    global fan_running
    if speed > fan_max:
        speed = fan_max
    elif speed < 0:
        speed = 0
    boost = not fan_running and speed > 0 and speed < fan_boost
    # if soft_boost is configured, we first run 0.25s at fan_boost
    if boost & soft_start:
        set_fan(fan_boost, False)
        sleep(0.25)
        boost = False
    set_fan(speed, boost)
    fan_running = speed >= fan_min
    if debug:
        print ("fan speed: ", speed)
    return()

def fan_off():
    set_fan_speed(0)
    return()

# main loop
#
# fan speed ramps up linearly from fan_min to fan_max when temperature goes from temp_min to temp_max

def loop():
    get_fan()
    temp = max(get_cpu_temperature(), get_video_temperature())
    if temp < temp_min:
        speed = 0
    else:
        speed = int((temp - temp_min) * (fan_max - fan_min) / (temp_max - temp_min) + fan_min)
    set_fan_speed(speed)
    return()

# main

if os.geteuid() != 0:
    exit("Are you root?")

fan_running = False
bus = smbus.SMBus(ltc1695_bus)

if len(sys.argv) == 2 and sys.argv[1].isdigit():
    speed = int(sys.argv[1])
    set_fan_speed(speed)
    get_fan()
    exit()
elif len(sys.argv) == 2 and sys.argv[1] == "-d":
    debug = True
elif len(sys.argv) != 1:
    print("Usage: fanctrl [-d] [speed]")
    print("where speed = 0 .. 63")
    exit()


try:
    while True:
        loop()
        sleep(57) # choose prime number in case some job starts up every minute
#        sleep(13)
except KeyboardInterrupt:
    fan_off()

# not truncated

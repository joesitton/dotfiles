#!/usr/bin/env python

import warnings
warnings.filterwarnings("ignore")

import requests as r
from subprocess import check_output
import time

def geolocate():
    ip = check_output(["curl", "-s", "ifconfig.me"]).decode()
    secret = ""
    url = f"https://api.ipgeolocation.io/ipgeo?apiKey={secret}"

    data = r.get(url).json()

    return str(data["latitude"]) + "," + str(data["longitude"])

def get_weather():
    latlon = geolocate()
    secret = ""
    url = f"https://api.darksky.net/forecast/{secret}/{latlon}"

    data = r.get(url).json()

    return data

def get_icon(name):
    return {
        "clear-day": "",
        "clear-night": "",
        "rain": "",
        "snow": "",
        "sleet": "",
        "wind": "",
        "fog": "",
        "cloudy": "",
        "partly-cloudy-day": "",
        "partly-cloudy-night": ""
    }[name]

def get_time(epoch):
    return time.strftime("%I:%M %p", time.localtime(epoch))

def cache_summary(weather):
    curr = weather["currently"]
    daily = weather["daily"]

    time = get_time(curr["time"])
    icon = get_icon(curr["icon"])
    c_summ = curr["summary"]
    precip = curr["precipProbability"]
    temp = str(int(curr["temperature"]))
    temp_c = int((int(temp) - 32) * 5/9)
    humid = str(int(curr["humidity"] * 100))
    clouds = str(int(curr["cloudCover"] * 100))
    summ = weather["daily"]["summary"]
    sunrise = get_time(daily["data"][0]["sunriseTime"])
    sunset = get_time(daily["data"][0]["sunsetTime"])

    f = open("/home/joe/Scripts/cache/daily_summary", "w")

    f.write(f"""{icon}  {temp}°F
{time}
{icon}  {c_summ}, {temp}°F ({temp_c}°C)

\t{sunrise}
\t{sunset}
\t{precip}%
\t{humid}%
\t{clouds}%

{summ[:-1]}
""")

    f.close()

if __name__ == "__main__":
    try:
        weather = get_weather()
        cache_summary(weather)
    except Exception as e:
        exit(1)

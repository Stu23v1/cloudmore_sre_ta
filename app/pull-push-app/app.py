#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests
import json
import time


def get_weather(city="Tallinn")-> dict:
    ''' Method to request data from external source'''

    url = "https://goweather.herokuapp.com/weather/Tallinn"
    headers = {
        "Content-Type": "application/json",
        "User-Agent": "'My User Agent 1.0"
    }

    try:
        response = json.loads(requests.request("GET", url, headers=headers).text)
    except:
        print("Remote weather server error")

    return response

def push_data(
    payload_value: int,
    payload_key="temperature",
    server="pushgateway:9091",
    job_name="temperature_in_tallinn",
    instance_name="pull-push-app",
    )-> str:

    ''' Method to push data to pushgateway'''

    url = "http://{s}/metrics/job/{j}/instance/{i}".format(
        s=server,
        j=job_name,
        i=instance_name)

    payload = "{k} {v}\n".format(k=payload_key, v=payload_value)

    try:
        response = requests.request("POST", url, data=payload)
    except:
        print("Pushgateway server error")

    return print("status_code: {s}".format(s=response.status_code))

if __name__ == "__main__":

    while True:
        weather = get_weather()
        push_data(weather['temperature'][:-3])
        time.sleep(360)

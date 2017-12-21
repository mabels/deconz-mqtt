# deconz-mqtt

This is a Python library that talk to the deCONZ REST API and publishes devices to MQTT.

I have started simple and publish only the lights and their status. There is much on the TODO-list. Feel free to contribute with Issues or Pull Requests.

- [ ] Include method of getting API key
- [ ] Publish status of lights when changed by deCONZ
- [ ] Change more than just the dim level on the lights (saturation, hue etc.)
- [ ] Other devices

## Installation

Clone this repository and make a production configuration file

```
$ clone https://github.com/xibriz/deconz-mqtt.git
$ cd deconz-mqtt/
$ cp config/default.cfg config/prod.cfg
```

Change all the FIXME values in `config/prod.cfg` exept for the `api_key`

Go to the SETTINGS tab in the Wireless Light web interface and click `Unlock Gateway`

Run the apikey.py script
` $ python apikey.py `

Change the `WorkingDirectory` in `deconz-mqtt.service`

Copy the service file to the system-folder and enable the service

```
$ sudo cp deconz-mqtt.service /etc/systemd/service/
$ sudo systemctl enable deconz-mqtt.service
$ sudo systemctl start deconz-mqtt.service
```

## Test

From a MQTT-client:

Get status from light 1
` $ mosquitto_pub -t 'deconz/1/status' -m '' `

Dim light 1 to 40%
` $ mosquitto_pub -t 'deconz/1/set' -m '40' `

Turn off light 1
` $ mosquitto_pub -t 'deconz/1/set' -m '0' `

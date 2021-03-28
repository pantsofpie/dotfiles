#!/bin/bash

pacat -r --latency-msec=1 -d alsa_input.usb-Blue_Microphones_Yeti_Stereo_Microphone_797_2019_10_30_56021-00.analog-stereo | pacat -p --latency-msec=1 -d alsa_output.usb-Cypress_Tech_Cypress_Tech_DCT-16_0000-00.analog-stereo

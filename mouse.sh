#!/bin/bash

input=`xinput list | grep Lite-On | grep pointer | cut -d "=" -f 2 | cut -d$'\t' -f 1`
xinput set-prop $input 262 0.3

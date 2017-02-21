#!/bin/bash

input=`xinput list | grep Lite-On | grep pointer | cut -d "=" -f 2 | cut -d$'\t' -f 1`
prop=`xinput list-props $input | grep "Constant Deceleration" | cut -d"(" -f 2 | cut -d")" -f1`
xinput set-prop $input $prop 0.3

# To list properties:
# xinput list-props $input

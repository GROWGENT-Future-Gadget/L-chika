#!/bin/sh
GPIO1=7
GPIO2=25
GPIO3=24
GPIO4=23
GPIO5=22
GPIO6=27
GPIO7=17
GPIO8=4

#Setting
echo "$GPIO1" > /sys/class/gpio/export
echo "$GPIO2" > /sys/class/gpio/export
echo "$GPIO3" > /sys/class/gpio/export
echo "$GPIO4" > /sys/class/gpio/export
echo "$GPIO5" > /sys/class/gpio/export
echo "$GPIO6" > /sys/class/gpio/export
echo "$GPIO7" > /sys/class/gpio/export
echo "$GPIO8" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio$GPIO1/direction
echo "out" > /sys/class/gpio/gpio$GPIO2/direction
echo "out" > /sys/class/gpio/gpio$GPIO3/direction
echo "out" > /sys/class/gpio/gpio$GPIO4/direction
echo "out" > /sys/class/gpio/gpio$GPIO5/direction
echo "out" > /sys/class/gpio/gpio$GPIO6/direction
echo "out" > /sys/class/gpio/gpio$GPIO7/direction
echo "out" > /sys/class/gpio/gpio$GPIO8/direction

echo 1 > /sys/class/gpio/gpio$GPIO1/value
echo 1 > /sys/class/gpio/gpio$GPIO2/value
echo 1 > /sys/class/gpio/gpio$GPIO3/value
echo 1 > /sys/class/gpio/gpio$GPIO4/value
echo 1 > /sys/class/gpio/gpio$GPIO5/value
echo 1 > /sys/class/gpio/gpio$GPIO6/value
echo 1 > /sys/class/gpio/gpio$GPIO7/value
echo 1 > /sys/class/gpio/gpio$GPIO8/value
sleep 1

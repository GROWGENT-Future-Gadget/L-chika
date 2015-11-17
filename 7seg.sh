#!/bin/sh

###################################
#          CONFIGURATION          #
###################################
#--- DEBUG Settings
DEBUG=true

#--- GPIO Setting
GPIO[1]="7"
GPIO[2]="25"
GPIO[3]="24"
GPIO[4]="23"
GPIO[5]="22"
GPIO[6]="27"
GPIO[7]="17"
GPIO[8]="4"

#--- LED Pattern
pattern[0]="3 4 5 6 7 8"
pattern[1]="6 7"
pattern[2]="2 4 5 7 8"
pattern[3]="2 5 6 7 8"
pattern[4]="2 3 6 7"
pattern[5]="2 3 5 6 8"
pattern[6]="2 3 4 5 6 8"
pattern[7]="3 6 7 8"
pattern[8]="2 3 4 5 6 7 8"
pattern[9]="2 3 5 6 7 8"
pattern[99]="1"



###################################
#            FUNCTIONS            #
###################################
#--- Initialize
_7seg_init() {
    if $DEBUG; then
        echo "[DEBUG] called: ${FUNCNAME[0]}"
    fi

    for i in {1..8}; do
      if $DEBUG; then
          echo -e "\tRUN: echo \"${GPIO[i]}\" > /sys/class/gpio/export"
          echo -e "\tRUN: echo \"out\" > /sys/class/gpio/gpio${GPIO[i]}/direction"
      else
          echo "${GPIO[i]}" > /sys/class/gpio/export
          echo "out" > /sys/class/gpio/gpio${GPIO[i]}/direction
      fi
    done
}

#--- Reset
_7seg_reset() {
    if $DEBUG; then
        echo "[DEBUG] called: ${FUNCNAME[0]}"
    fi

    for i in {1..8}; do
        if $DEBUG; then
            echo -e "\tRUN: echo 0 > /sys/class/gpio/gpio${GPIO[i]}/value"
        else
            echo 0 > /sys/class/gpio/gpio${GPIO[i]}/value
        fi
    done
}

#--- Display number or dot
_7seg_disp() {
    if $DEBUG; then
        echo "[DEBUG] called: ${FUNCNAME[0]}"
    fi

    for i in ${pattern[$1]}; do
        if $DEBUG; then
            echo -e "\tRUN: echo 1 > /sys/class/gpio/gpio$i/value"
        else
            echo 1 > /sys/class/gpio/gpio$i/value
        fi
    done
}



###################################
#              MAIN               #
###################################
if $DEBUG; then
    echo "[DEBUG] called: $0 $@"
fi

_7seg_init
_7seg_reset

case $1 in
    [0-9]) _7seg_disp $1;;
    [Dd]) _7seg_disp 99;;
esac

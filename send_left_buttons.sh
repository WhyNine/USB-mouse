#!/bin/bash

REPEAT=$1
re='^[0-9]+$'
if ! [[ $REPEAT =~ $re ]] ; then
   echo "error: Not a number" >&2; exit 1
fi
if [[ $REPEAT -eq 0 ]] ; then
  echo "error: must be greater than zero" >&2; exit 1
fi

while [ $REPEAT -gt 0 ]
do
  echo "--b1" | sudo ./hid_gadget_test /dev/hidg0 mouse > /dev/null
  echo $REPEAT
  sleep 0.3
  REPEAT=$(( $REPEAT - 1 ))
done

#!/bin/bash
# Made by Andrej Pakhutin
# this is reporting wrapper for nrpe
# it will send the content of selected file to stdout
# and exit with specified code to emulate normal nagios plugin
# Also it will check if source file is fresh enough
#
# Use with <file name to report> [<max seconds old to be fresh>]
# repo is in github.com/kadavris

workdir=/etc/nagios/nrpe.d/nrpe-cron

file=$1

# link. currently we support the full paths from /dev/disk/by-id/something to /dev/sdX
if [ -h "$file" ]; then
  file=`readlink -f "$file"`

  if [ ! -b "$file" ]; then
    echo Bad parameter: $file
    exit 3
  fi

  file=${file##*/}
fi

file=$workdir/$file

if [ -z "$2" ]; then
  # if data is more than 10 hour old - set alarm
  maxold=36000
else
  maxold=$2
fi

fdate=`/usr/bin/stat -c%Y "$file"`

d=`/usr/bin/date +%s`

diff=$(( $d - $fdate ))

if [ $diff -gt $maxold ]; then # too long w/o updates
  echo "UNDEFINED: Not updated since " `/usr/bin/date -d @$fdate`
  exit 3
else
  cat "$file" |
  (
  read str
  read rc
  echo $str
  exit $rc
  )
fi

exit $?

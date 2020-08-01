#!/bin/bash
# a part of the wrapper for nagios nrpe.
# This one produces reports that can be transmitted by nrpe.
# repo is in github.com/kadavris

function check_ide_smart
{
  cd /dev

  for drive in sd?
  do
    # doing check_ide_smart run
    {
      /usr/lib/nagios/plugins/check_ide_smart -d /dev/$drive 
      echo $?
    } > $reports/$drive

    # this will be used for temperature reporting and some other
    /usr/sbin/smartctl -a /dev/$drive > $reports/smartctl_${drive}
  done
}

########################################
if [ -z "$1" ]; then
  echo Use: $0 function-name
  echo functions:
  echo   check_ide_smart
  exit 1
fi

reports=/etc/nagios/nrpe.d/nrpe-cron
[ -d $reports ] || mkdir $reports

for f in $*
do
  $f
done

/bin/chown -R nagios $reports

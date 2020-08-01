#!/bin/sh
# a part of the wrapper for nagios nrpe.
# This one runs from cron and calls script that will produce reports
# that can be transmitted by nrpe.
# repo is in github.com/kadavris

/etc/nagios/nrpe.d/nrpe-make-reports.sh check_ide_smart

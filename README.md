# nagios-plugins
##Some custom-made plugins for Nagios monitoring system
* check_dir - This Nagios plugin can check the provided sub-tree size and age.  
 It can be used as a standalone tool via cron when additional permissions required.  
 requires perl, perl::Getopt, df, du and find utilities
* check_hddtemp - Simple Nagios plugin to get the temperatue of HDDs, calling the hddtemp daemon via ncat.  
 While hddtemp is seriously bugged, giving up on external queries when there is load on disk subsystem,
 I switched to nrpe/nrpe-cron.sh + nrpe/nrpe-hdd-temp-reporter pair, which gets status from SMART
 requires perl, ncat
* check_md_raid - MD raid Nagios plugin. Collects a lot of data from /sys/block tree.  
 Has verbosity level to display more or less clutter  
 requires perl, perl::Getopt
* nrpe/01-disks.cfg
 example nrpe config
* nrpe/btrfs-devstat-cron.pl
 1st part of btrfs status reporter
 requires perl
* nrpe/btrfs-devstat-reporter.pl
 2nd part of btrfs status reporter
 requires perl
* nrpe/nrpe-cron.sh
 Place into cron.hourly or set up some other cron entry to generate two kinds of reports:  
 smartctl raw output for getting the drive temperature readings  
 and nagios's check_ide_smart for sudo-less operations
* nrpe/nrpe-make-reports.sh
 This is the actual code that is called from nrpe/nrpe-cron.sh and makes smartctl and check_ide_smart reports
* nrpe/nrpe-hdd-temp-reporter
 This script is nagios plugin that reads the smartctl kind of output of nrpe/nrpe-cron.sh  
 and gets the drive's temperature from it.  
 Also checks if report is stale in case of script errors, etc
 requires perl
* nrpe/nrpe-reporter.sh
 This is a fancy 'cat' that reads specified file and act as a nagios plugin, returning it's contents  
 and exitcode
 Also checks if report is stale in case of script errors, etc

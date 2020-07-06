# nagios-plugins
Some custom-made plugins for Nagios monitoring system
check_dir - This Nagios plugin can check the provided sub-tree size and age.
    It can be used as a standalone tool via cron when additional permissions required.
    requires perl, perl::Getopt, df, du and find utilities
check_hddtemp - Simple Nagios plugin to get the temperatue of HDDs, calling the hddtemp daemon via ncat.
    requires perl, ncat
check_md_raid - MD raid Nagios plugin. Collects a lot of data from /sys/block tree.
    Has verbosity level to display more or less clutter
    requires perl, perl::Getopt

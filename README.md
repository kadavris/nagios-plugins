# nagios-plugins
<h3>Some custom-made plugins for Nagios monitoring system</h3>
<ul>
<li>check_dir - This Nagios plugin can check the provided sub-tree size and age.
    <p>It can be used as a standalone tool via cron when additional permissions required.<br>
    requires perl, perl::Getopt, df, du and find utilities</p>
<li>check_hddtemp - Simple Nagios plugin to get the temperatue of HDDs, calling the hddtemp daemon via ncat.
    <p>requires perl, ncat</p>
<li>check_md_raid - MD raid Nagios plugin. Collects a lot of data from /sys/block tree.
    <p>Has verbosity level to display more or less clutter<br>
    requires perl, perl::Getopt</p>

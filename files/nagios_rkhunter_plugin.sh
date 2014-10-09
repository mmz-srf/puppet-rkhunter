#!/bin/bash
#
# 18-03-2014
# Author: Gianni Carafa <gicara@gmail.com>
#

# exit codes
e_ok=0
e_warning=1
e_critical=2
e_unknown=3

usage="$0 -a [FILEAGE IN MINUTES] -f [PATH TO CRONJOB LOGFILE]"

if [ -z $1 ]; then
    echo $usage
    exit $e_unknown
fi

while getopts ":a:f:" options
do
    case $options in
        a ) fileage=$OPTARG ;;
        f ) file=$OPTARG ;;
        * ) echo $usage
            exit $e_unknown ;;
    esac
done

# check if file exists
if [ -f $file ];
then
    #get last modified
    lmod=`stat --format -%Y $file | tr -d "-"`
else
    echo "PLUGIN ERROR: File $file not found!"
    exit $e_unknown
fi


# get number of warnings
warning_counter=$(cat $file | grep Warning | wc -l)

if [ $warning_counter -gt 0 ]
then
    echo "ALERT: System not secured. $warning_counter open issues. Check Alert details!"
    cat $file
    exit $e_critical
fi

# check if fileage is not to old
timee=`date +%s`
diff=`expr $timee - $lmod`
diffm=`expr $diff / 60`

if [ $diffm -ge $fileage ];
then
    echo "RKUNTER ERROR: Logfile to old"
    exit $e_warning
fi

# Everything is going well
echo "OK: you are secure. Go get a beer."
exit $e_ok

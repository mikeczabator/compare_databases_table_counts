#!/bin/bash

red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
gry=$'\e[0;37m'
end=$'\e[0m'

memsql_prev=0
druid_prev=0

while true
do
        memsql_count=`mysql --host 172.31.4.117 --port 3306 --user root taxidata_json -e 'select count(*) as "" from yellow_trips_3;'`
        druid_count=`/usr/bin/dsql-main --host 172.31.9.93:8082 -e 'select count(*) as "druid count" from yellowtaxidata_json' --format csv`
        druid_count=`echo $druid_count | tr -d '\r'`

        printf "=============\n"
        printf "%s %'.f %s %'.f %s\n" ${mag}"MemSQL count:      "  $memsql_count "        ( delta since last run: " $(($memsql_count-$memsql_prev)) ")"
        printf "%s %'.f %s %'.f %s\n" ${gry}" Druid count:      " $druid_count "         ( delta since last run: " $(($druid_count-$druid_prev)) ")"
        printf "${end}\n"
        difference=$(($memsql_count-$druid_count))
        difference=`echo $difference | sed 's/-//'`


        printf "%s %'.f\n" ${red}"    diff of :      "  $difference
        printf "${end}\n\n"
        memsql_prev=$memsql_count
        druid_prev=$druid_count
        sleep 2
done

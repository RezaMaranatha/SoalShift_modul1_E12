#!/bin/bash"

upper=ABCDEFGHIJKLMNOPQRSTUVWXYZ 
lower=abcdefghijklmnopqrstuvwxyz 
hour=`date +"%H"`
rot=($hour % 26)
upper2=($(echo ${upper[@]})$(echo ${upper[@]}))
lower2=($(echo ${lower[@]})$(echo ${lower[@]}))
union=($(echo ${upper[@]})$(echo ${lower[@]}))
newup=$(echo $upper | tr "${upper:0:26}" "${upper2:${rot}:26}")
newlow=$(echo $lower | tr "${lower:0:26}" "${lower2:${rot}:26}")
union2=($(echo ${newup[@]})$(echo ${newlow[@]}))

#NOW=$(echo $phrase | tr "${union}" "${union2}")

NOW=`date +"%H:%M %d-%m-%Y"`
< /var/log/syslog > "$NOW" tr "${union}" "${union2}"

#!/bin/bash"

read NOW
upper=ABCDEFGHIJKLMNOPQRSTUVWXYZ
lower=abcdefghijklmnopqrstuvwxyz
hour=${NOW:0:2}
rot=($hour % 26)
upper2=($(echo ${upper[@]})$(echo ${upper[@]}))
lower2=($(echo ${lower[@]})$(echo ${lower[@]}))
union=($(echo ${upper[@]})$(echo ${lower[@]}))
newup=$(echo $upper | tr "${upper:0:26}" "${upper2:${rot}:26}")
#echo ${newup}
newlow=$(echo $lower | tr "${lower:0:26}" "${lower2:${rot}:26}")
union2=($(echo ${newup[@]})$(echo ${newlow[@]}))

#echo $hour
#NOW=$(echo $phrase | tr "${union}" "${union2}")

< "$NOW" > "$NOW Decrypt" tr "${union2}" "${union}"

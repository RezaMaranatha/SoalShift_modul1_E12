#!/bin/bash
a=`awk -F, '{if($7=="2012") arr[$1]=arr[$1]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -nrk2 | awk -F, 'NR==1{print $1}'`
echo $a

b=`awk -F, -v temp="$a" '{if($1==temp&&$7=="2012") arr[$4]=arr[$4]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR==1{print $1}'`
echo $b

c=`awk -F, -v temp1="$a" '{if($1==temp1&&$7=="2012") arr[$4]=arr[$4]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR==2{print $1}'`
echo $c

d=`awk -F, -v temp2="$a" '{if($1==temp2&&$7=="2012") arr[$4]=arr[$4]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 | awk -F, 'NR==3{print $1}'`
echo $d

data=`awk -F, -v var="$a" -v var1="$b" '{if($1==var&&$4==var1&&$7=="2012") arr[$6]=arr[$6]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR<3{print $1 ","}NR==3{print $1}'`
echo $data

data1=`awk -F, -v var="$a" -v var1="$c" '{if($1==var&&$4==var1&&$7=="2012") arr[$6]=arr[$6]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR<3{print $1 ","}NR==3{print $1}'`
echo $data1

data2=`awk -F, -v var="$a" -v var1="$d" '{if($1==var&&$4==var1&&$7=="2012") arr[$6]=arr[$6]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR<3{print $1 ","}NR==3{print $1}'`
echo $data2

#!/bin/bash
a=`awk -F, '{if($7=="2012") arr[$1]=arr[$1]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -nrk2 | awk -F, 'NR==1{print}'`
echo $a

atemp=`echo $a | awk -F, 'NR==1{print $1}'`
#echo $hai

b=`awk -F, -v temp="$atemp" '{if($1==temp&&$7=="2012") arr[$4]=arr[$4]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR==1{print}'`
echo $b

btemp=`echo $b | awk -F, 'NR==1{print $1}'`
#echo $btemp

c=`awk -F, -v temp1="$atemp" '{if($1==temp1&&$7=="2012") arr[$4]=arr[$4]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR==2{print}'`
echo $c

ctemp=`echo $c | awk -F, 'NR==1{print $1}'`
#echo $ctemp

d=`awk -F, -v temp2="$atemp" '{if($1==temp2&&$7=="2012") arr[$4]=arr[$4]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 | awk -F, 'NR==3{print}'`
echo $d

dtemp=`echo $d | awk -F, 'NR==1{print $1}'`
#echo $dtemp

data=`awk -F, -v var="$atemp" -v var1="$btemp" -v var2="$ctemp" -v var3="$dtemp" '{if(($1==var&&$4==var1&&$7=="2012")||($1==var&&$4==var2&&$7=="2012")||($1==var&&$4==var3&&$7=="2012")) arr[$6]=arr[$6]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR==1{print $1 " " $2 ","}NR==2{print $1 " " $2 ","}NR==3{print $1 " " $2}'`
echo $data

#data1=`awk -F, -v var="$a" -v var1="$c" '{if($1==var&&$4==var2&&$7=="2012") arr[$6]=arr[$6]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR<3{print $1 ","}NR==3{print $1}'`
#echo $data1

#data2=`awk -F, -v var="$a" -v var1="$d" '{if($1==var&&$4==var3&&$7=="2012") arr[$6]=arr[$6]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR<3{print $1 ","}NR==3{print $1}'`
#echo $data2

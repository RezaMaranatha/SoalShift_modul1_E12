#!/bin/bash
echo "Input jumlah password yang akan dibuat : "
read n

for((num=1; num<=n; num+=1))
do
	if [ -f ~/Desktop/Modul1/"password$num.txt" ]
		then n=$n+1
	else
		`< /dev/urandom tr -dc A-Za-z0-9 | head -c12 &>> "password$num.txt"`
	fi
done

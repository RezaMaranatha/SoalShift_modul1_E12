
#!/bin/bash
unzip ~/Desktop/Modul1/nature.zip
gambar=`ls ~/Desktop/Modul1/nature | grep "[.]jpg$"` 

for i in $gambar
do 
#	echo "$i"
	base64 -d ~/Desktop/Modul1/nature/"$i" | xxd -r > ~/Desktop/Modul1/"res$i" 
done 


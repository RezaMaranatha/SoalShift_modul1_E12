# Soal Shift Modul 1 E12
by:<br/> 
I Dewa Putu Wiprah A      (05111740000152)<br/>
Reza Adipatria Maranatha  (05111740000186)
# 1
Untuk menjawab soal pertama, kita perlu dahulu download file nature.zip kemudian extract nature.zip ke folder yang kita inginkan. Karena setiap foto telah di encrypt, kita perlu decrypt masing-masing foto. Untuk decrypt kita menggunakan command `base64 -d` karena foto telah di encrypt menggunakan base64. Kemudian karena hasil dari "base64 -d" merupakan hexadecimal, kita perlu menggunakan command `xxd -r` untuk me-reverse hexadecimal ke format awal sebelum di encrypt.

Kemudian untuk schedule nya, kita menambahkan crontab 
"14 14 14 2 5" agar menjalankan file tersebut jam 14:14 tanggal 14 atau hari jumat di bulan Februari
# 2
Untuk mengerjakan soal nomor 2, pertama kita harus mengunduh WA_Sales_Products_2012-14.csv. Lalu untuk mengerjakan soal (a), kita perlu mencari negara dengan penjualan terbanyak di tahun 2012 sehingga kita menggunakan awk dengan sintaks "awk -F, '{if($7=="2012") arr[$1]=arr[$1]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -nrk2 | awk -F,  'NR==1{print $1}'" , lalu hasil dari awk soal (a) disimpan dalam variable yang nantinya akan diakses di soal (b) dan (c). Pada soal (b) diminta untuk mencari tiga product line terbanyak dari negara yang ditunjuk pada soal (a), maka maka setiap product line disimpan dalam tiga variable berbeda dengan sintaks "b=`awk -F, -v temp="$a" '{if($1==temp&&$7=="2012") arr[$4]=arr[$4]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR==1{print $1}'` ; c=`awk -F, -v temp1="$a" '{if($1==temp1&&$7=="2012") arr[$4]=arr[$4]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR==2{print $1}'` ; d=`awk -F, -v temp2="$a" '{if($1==temp2&&$7=="2012") arr[$4]=arr[$4]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 | awk -F, 'NR==3{print $1}'`" . Pada soal (c) diminta untuk mencari tiga product dengan penjualan terbayak dari setiap produk line, maka digunakan sintaks "data=`awk -F, -v var="$a" -v var1="$b" '{if($1==var&&$4==var1&&$7=="2012") arr[$6]=arr[$6]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 | awk -F, 'NR<3{print  $1 ","}NR==3{print $1}' ; data1=`awk -F, -v var="$a" -v var1="$c" '{if($1==var&&$4==var1&&$7=="2012") arr[$6]=arr[$6]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR<3{print $1 ","}NR==3{print $1}' ; data2=`awk -F, -v var="$a" -v var1="$d" '{if($1==var&&$4==var1&&$7=="2012") arr[$6]=arr[$6]+$10} END{for (i in arr) print i "," arr[i]}' WA_Sales_Products_2012-14.csv |sort -t, -nrk2 |awk -F, 'NR<3{print $1 ","}NR==3{print $1}'"


# 3
Untuk menjawab soal ke-5, kita perlu membuat random password yang nantinya akan disimpan di file .txt. Pertama kita minta input dari user untuk membuat berapa file. Kemudian untuk membuat file random kita gunakan command `< /dev/urandom tr -dc A-Za-z0-9 | head -c12 &>> "password$num.txt"` command `/dev/urandom tr -dc A-Za-z0-9` membuat random word dari aplhanumeric character, kemudian command `head -c12` untuk limit characternya menjadi hanya 12 character saja. Untuk If statement di awal, merupakan untuk cek apabila file dengan nama tersebut sudah ada maka, jumlah file yang perlu dibuat akan dilanjutkan dari file terakhir yang dibuat. 

Contoh : pertama buat 5 file, kemudian buat lagi 5 file, lalu cek nama file nya, jika sudah ada maka lanjutkan membuat file no 6

# 4
Untuk mengerjakan soal nomor 4, pertama menyiapkan array yang berisi alfabet uppercase dari A-Z, lalu alfabet lowercase dari a-z. Lalu untuk meng enkripsi syslog, harus mentranslate format file syslog yaitu [A-Za-z] menjadi sebuah format baru dimana urutan huruf ditambah jam pada saat itu ( misal jam=12, maka huruf a+12 = m, sehingga format menjadi [ M-ZA-Lm-za-l ] ). Prinsip pengerjaan nya seperti Caesar Cipher dimana jam sistem menentukan ROT yang akan digunakan. Lalu, membuat crontab dimana script tadi dijalankan setiap jam. Kemudian untuk men dekripsi file syslog yang telah ter enkripsi tadi, maka tingga membalik format yang sebelumnya menjadi [A-Za-z] ( misal file sebelumnya di enkripsi pada jam 12, maka format yang sebelumnya [ M-ZA-Lm-za-l ] menjadi [ A-Za-z ]) 

# 5
Untuk menjawab soal ke-5, kita diminta untuk backup syslog kedalam suatu file tetapi terlebih dahulu di encrypt. Pertama kita `cat /var/log/syslog` untuk mengambil isi dari syslog, kemudian kita pipe dengan `awk 'tolower($0) ~ /cron/ && tolower($0) ~ !/sudo/ {print $0}' | awk 'NF<13'  >> /home/reza/modul1` command tolower digunakan untuk mengubah huruf besar menjadi huruf kecil, karena di soal diminta searching secara case insensitive, maka semua kita tolower dahulu baru kita search kalimat yang memiliki "cron" tetapi tidak memiliki "sudo", kemudian `awk 'NF<13'` untuk membatasi field yang ditampilkan, karena di soal diminta kurang dari 13 maka NF<13 kemudian disimpan di `/home/[user]/modul1`

Untuk schedule kita isi di crontab `2-30/6 * * * *` karena diminta di soal kita mem-backup syslog selama menit 2-30 setiap 6 menit 

# Soal Shift Modul 1 E12
# 1
Untuk menjawab soal pertama, kita perlu dahulu download file nature.zip kemudian extract nature.zip ke folder yang kita inginkan. Karena setiap foto telah di encrypt, kita perlu decrypt masing-masing foto. Untuk decrypt kita menggunakan command `base64 -d` karena foto telah di encrypt menggunakan base64. Kemudian karena hasil dari "base64 -d" merupakan hexadecimal, kita perlu menggunakan command `xxd -r` untuk me-reverse hexadecimal ke format awal sebelum di encrypt.

Kemudian untuk schedule nya, kita menambahkan crontab 
"14 14 14 2 5" agar menjalankan file tersebut jam 14:14 tanggal 14 atau hari jumat di bulan Februari
# 2


# 3
Untuk menjawab soal ke-5, kita perlu membuat random password yang nantinya akan disimpan di file .txt. Pertama kita minta input dari user untuk membuat berapa file. Kemudian untuk membuat file random kita gunakan command `< /dev/urandom tr -dc A-Za-z0-9 | head -c12 &>> "password$num.txt"` command `/dev/urandom tr -dc A-Za-z0-9` membuat random word dari aplhanumeric character, kemudian command `head -c12` untuk limit characternya menjadi hanya 12 character saja. Untuk If statement di awal, merupakan untuk cek apabila file dengan nama tersebut sudah ada maka, jumlah file yang perlu dibuat akan dilanjutkan dari file terakhir yang dibuat. 

Contoh : pertama buat 5 file, kemudian buat lagi 5 file, lalu cek nama file nya, jika sudah ada maka lanjutkan membuat file no 6

# 4


# 5
Untuk menjawab soal ke-5, kita diminta untuk backup syslog kedalam suatu file tetapi terlebih dahulu di encrypt. Pertama kita `cat /var/log/syslog` untuk mengambil isi dari syslog, kemudian kita pipe dengan `awk 'tolower($0) ~ /cron/ && tolower($0) ~ !/sudo/ {print $0}' | awk 'NF<13'  >> /home/reza/modul1` command tolower digunakan untuk mengubah huruf besar menjadi huruf kecil, karena di soal diminta searching secara case insensitive, maka semua kita tolower dahulu baru kita search kalimat yang memiliki "cron" tetapi tidak memiliki "sudo", kemudian `awk 'NF<13'` untuk membatasi field yang ditampilkan, karena di soal diminta kurang dari 13 maka NF<13 kemudian disimpan di `/home/[user]/modul1`

Untuk schedule kita isi di crontab `2-30/6 * * * *` karena diminta di soal kita mem-backup syslog selama menit 2-30 setiap 6 menit 

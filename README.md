# Soal Shift Modul 1 E12
# 1
Untuk menjawab soal pertama, kita perlu dahulu download file nature.zip kemudian extract nature.zip ke folder yang kita inginkan. Karena setiap foto telah di encrypt, kita perlu decrypt masing-masing foto. Untuk decrypt kita menggunakan command "base64 -d" karena foto telah di encrypt menggunakan base64. Kemudian karena hasil dari "base64 -d" merupakan hexadecimal, kita perlu menggunakan command "xxd -r" untuk me-reverse hexadecimal ke format awal sebelum di encrypt.

Kemudian untuk schedule nya, kita menambahkan crontab 
"14 14 14 2 5" agar menjalankan file tersebut jam 14:14 tanggal 14 atau hari jumat di bulan Februari
# 2


# 3
Untuk menjawab soal ke-tiga, kita perlu membuat random password yang nantinya akan disimpan di file .txt. Pertama kita minta input dari user untuk membuat berapa file. Kemudian untuk membuat file random kita gunakan command 

# 4


# 5

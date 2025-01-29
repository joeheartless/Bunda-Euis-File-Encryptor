#!/bin/bash
# BUNDA-EUIS File Encryptor v.1
# Created by Prima Setiawan / joeheartless

read -sp "Enter password: " pass
echo ""

# Dapetin semua file kecuali script dan file yang udah terenkripsi
file_list=$(find . -maxdepth 1 -type f -not -name "bunda.*" -not -name "*.sh")

i=1
for enc in $file_list; do 
    echo "[$i] File $enc encrypted"
    openssl enc -aes-256-cbc -in "$enc" -out "bunda.$enc" -pbkdf2 -k "$pass"
    
    # Hapus file original setelah dienkripsi
    rm -f $file
    
    i=$((i + 1))
done

# Tambahin README buat info
echo "File encrypted, use Bunda-Euis-Decryptor to decrypt." > README.txt
echo "--------------------------------------------------------------------------------------------------------------------------------------"
ls


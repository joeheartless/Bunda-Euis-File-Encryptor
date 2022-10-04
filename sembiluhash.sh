#!/bin/bash
if [[ "$1" == "-h" ]]; then 
	echo "HELP OPTION"
	echo "----------SEMBILU HASH-----------"
	echo "AUTHOR"
	echo "   Written by Joe Heartless"
	echo ""
	echo "[OPTION]"
	echo "-e = encoding {string} "	
	echo "-d = decoding {hash}"
        echo ""
	echo "example:"
	echo "sembiluhash [OPTION] [ARGS]..."
	echo "sembiluhash -e kontol"
	echo "sembiluhash -d M33MEK"
	echo "just that, just like that."
        echo "++++++++++++++eof++++++++++++++++"
else
	touch .token.key
	init=$(date +%s | cut -c 7-10) 
	if [[ "$1" == "-e" ]]; then
        	showtk=`echo $2$init |  md5sum | cut -c 1-6`
        	echo $showtk $2 | base64 > .token.key
        	echo "[Hashed text:] ${showtk^^}"
		sleep 1
	else
		if [[ "$1" == "-d" ]]; then
			token=`cat .token.key`
			check=`echo "$token" | base64 --decode 2>/dev/null | awk {'print $1'}`
			decu=`echo "$token" | base64 --decode 2>/dev/null | cut -d ' ' -f2-`
			if [ "${2,,}" == "$check" ]; then
		                echo "[Plaintext:] $decu"
				echo "$RANDOM$RANDOM" > .token.key
		        else
        		        sleep 1
                		echo "[hash unrecognized!]"
        		fi
        		sleep 1

		else 
			echo "Invalid option! -h for option."
		fi
	fi
fi

#!/bin/bash

echo -e "============================"
echo -e "INFORMATION"
echo -e "----------------------------"
echo -e "Kotelnikov Nikita, 718-1"
echo -e "Find file"
echo -e "============================\n"


PROGRUM=true  

while $PROGRUM; do
    read -p "Enter the directory path: " DIR

    if ! [ -d "$DIR" ]; then
        echo -e "ERROR DIRECTORY!\n"
        continue 
    fi


    echo -e "\n1) File name\n2) File size"
    read -p "Select type find: " SELECT

    if [ "$SELECT" = "1" ]; then
        echo ""
        read -p "Enter name of file: " FILENAME

        if [ "$FILENAME" = "" ]; then 
            echo "ERROR NAME FILE!\n"
            continue
        fi

        echo "FILES: "
        find $DIR -name $FILENAME 2>error.txt
        echo -e "\n"


    elif [ "$SELECT" = "2" ]; then
        echo ""
        read -p "Eter size of file: " FILESIZE
        
        echo "FILES: "
        find $DIR -size $FILESIZE 2>error.txt
        echo -e "\n"

    else
        echo -e "ERROR INPUT!\n"
        continue
    fi


done

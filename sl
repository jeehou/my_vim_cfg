#!/bin/sh
CFG_FILE=~/.slrc
if [ ! -f "$CFG_FILE" ];then
    echo "$CFG_FILE is empty"
    exit 0
fi

iIndex=0
while IFS= read -r var
do
    let "iIndex+=1"
    sshArray[$iIndex]=$var
done < "$CFG_FILE"


if [ x$1 == x ]
then    
    echo "This is a ssh tool for jee, Must scp your id_rsa.pub to target server and add to ~/.ssh/authorized_keys"
    echo "Usage : sl index" 
    echo "index:"
    iIndex=1
    for sshLine in "${sshArray[@]}"
    do
        echo "$iIndex) $sshLine"
        let "iIndex+=1"
    done
else
    echo "begin login server, ${sshArray[$1]}"
    ${sshArray[$1]}
fi

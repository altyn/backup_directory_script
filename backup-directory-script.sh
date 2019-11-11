#!/bin/sh
# Altynbek Shaidyldaev

PATH_TARGET="/target/path"
PATH_BACKUP="/target/to/backup"
ARC_NAME="backup"
NOW="$(date +"%d-%m-%Y_%H-%M")"

echo "archiving files"
tar czf $PATH_BACKUP/$ARC_NAME-$NOW.tar.gz $PATH_TARGET

if [ $? -ne 0 ]
then
    echo "archiving error"
    exit 13
    fi
            
    echo "removing old archives"
    find $PATH_BACKUP/$ARC_NAME-*.tar.gz -mtime +20 | xargs rm -f

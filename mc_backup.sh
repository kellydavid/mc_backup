#First parameter is the name of the server
#Second parameter is the directory that the server runs in.
#Third parameter is the directory that the server will be backed up to.
# PATHS TO DIRECTORIES MUST BE ABSOLUTE PATH NAMES
SERVER_NAME=$1
SERVER_DIRECTORY=$2
BACKUP_DIRECTORY=$3
CURRENT_DATE=$(date +"%d-%m-%Y") 
BACKUP_FILE=$BACKUP_DIRECTORY"/"$SERVER_NAME"_"$CURRENT_DATE.tar.gz

# Create backup
echo Backing up $SERVER_NAME at $SERVER_DIRECTORY
tar -cpvzf $BACKUP_FILE $SERVER_DIRECTORY
echo Backup created at $BACKUP_FILE
/bin/bash ~/scripts/Dropbox-Uploader/dropbox_uploader.sh upload $BACKUP_FILE $SERVER_NAME

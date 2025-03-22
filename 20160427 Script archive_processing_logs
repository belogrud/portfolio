#!/bin/bash

#
#   Archive and transfer Infogate logs
#

# Logs dir
LOGS_DIR=/opt/pg2/infogate/logs/infogate

# Archive dir
ARCHIVE_DIR=/mnt/processinglogs

# Yesterday date
ARCHIVE_DATE=`date +%Y-%m-%d --date="1 day ago"`

# File list
ARCHIVE_FILES="gisgmp-smev-script-$ARCHIVE_DATE*.zip infows.$ARCHIVE_DATE*.zip notification-gisgmp-smev-script-$ARCHIVE_DATE* $ARCHIVE_DATE.zip rnip-smev-script-$ARCHIVE_DATE* cyber-script-$ARCHIVE_DATE* infogate.$ARCHIVE_DATE*.zip enrichment-$ARCHIVE_DATE*.zip"

TARGET_FILES=()

ZIP=`which zip`

# Push matched files from ARCHIVE_FILES to array, there also will be non-matched files, we delete them later
for file in $ARCHIVE_FILES
do
  TARGET_FILES+=($LOGS_DIR/$file)
done

# Join TARGET_FILES array with space and remove non-matching files (with * in filename)
TARGET_FILES_LIST=$(printf "%s " "${TARGET_FILES[@]//*\*/}")

echo "Target files:"
echo $TARGET_FILES_LIST
echo "--------------------"

# Archive all matched files
echo "Creating ZIP-archive $ARCHIVE_DIR/$ARCHIVE_DATE.zip..."
$ZIP -r $ARCHIVE_DIR/$ARCHIVE_DATE.zip $TARGET_FILES_LIST --verbose
echo "Done"

# Delete all matched files
echo "Removing files from original location"
rm -f $TARGET_FILES_LIST
echo "Done"

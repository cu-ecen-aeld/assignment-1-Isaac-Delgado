#
# 9) Write a shell script finder-app/finder.sh as described below:
# Accepts the following runtime arguments: 
#   the first argument is a path to a directory on the filesystem, referred to below as filesdir; 
#   the second argument is a text string which will be searched within these files, referred to below as searchstr
# 
#   Exits with return value 1 error and print statements if any of the parameters above were not specified
#   Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
#   Prints a message "The number of files are X and the number of matching lines are Y"
#                       where X is the number of files in the directory and all subdirectories 
#                       and Y is the number of matching lines found in respective files, 
#                       where a matching line refers to a line which contains searchstr 
#                       (and may also contain additional content).
# 
#   Example invocation:
#   finder.sh /tmp/aesd/assignment1 linux
###
#!/bin/bash


REQUIRED_PARAM_N=2

FILES_DIR=$1
TARGET_TEXT=$2


if [ $# != $REQUIRED_PARAM_N ]
then
    echo "Invalid quantity of params provided, we are expecting exactly 2 params <filesdir> <searchstr>"
    exit 1
fi

if [ ! -d $FILES_DIR ] #Not a valid directory, The param 1 ($1) is not a directory (-d)
then
    echo "Invalid directory provided 2" $2
    exit 1
fi

FILE_COUNT=$(find "$FILES_DIR" -type f | wc -l)
MATCH_COUNT=$(grep -r "$TARGET_TEXT" "$FILES_DIR" | wc -l)

echo "The number of files are $FILE_COUNT and the number of matching lines are $MATCH_COUNT"
###
#   Accepts the following arguments: 
#       the first argument is a full path to a file (including filename) on the filesystem, 
#           referred to below as writefile; 
#       the second argument is a text string which will be written within this file, 
#           referred to below as writestr
#
#   Exits with value 1 error and print statements if any of the arguments above were not specified ~
#
#   Creates a new file with name and path writefile with content writestr, ~
#   overwriting any existing file and creating the path if it doesn’t exist. ~ 
#   Exits with value 1 and error print statement if the file could not be created. ~
###

#!/bin/bash

WRITE_FILE=$1
WRITE_STR=$2

EXPECTED_PARAM_COUNT=2

if [ $EXPECTED_PARAM_COUNT != $# ]
then
    echo "Expected $EXPECTED_PARAM_COUNT params, received $#"
    exit 1
fi

mkdir -p "$(dirname "$WRITE_FILE")"

CMD_RESULT=$?

if [ $CMD_RESULT != 0 ]
then
    echo "Error creating file, error $CMD_RESULT"
    exit 1
fi

echo "$WRITE_STR" > "$WRITE_FILE"
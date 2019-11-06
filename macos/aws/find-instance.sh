#!/bin/bash

function findinstance() {
    PROFILE=$1
    REGION=$2
    SEARCH_STR=$3

    if [ "$#" -ne 3 ]; then
        echo "ERROR: You must enter exactly 3 command line arguments findinstance \$PROFILE \$REGION \$SEARCH_STR"
    else
        echo $(aws --profile $PROFILE --region $REGION ec2 describe-instances --filters "Name=tag:Name,Values=$SEARCH_STR" | grep PrivateIpAddress | awk '{print $2}' | egrep -v "\[" | sed  's/\"/ /g' | sed 's/\,//g' | sed 's/ //g' | uniq)
    fi
}

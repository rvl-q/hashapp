#!/bin/bash

. ./hasher.sh

# echo $HASH

# echo starting...

#uvicorn app.main:app --host 0.0.0.0 --port 80

# # function called by trap
# other_commands() {
#     tput setaf 1
#     printf "\r(SIG)INT caught      "
#     tput sgr0
#     sleep 1
#     printf "\rType a command >>> "
# }

# trap 'other_commands' INT

# while true; do
#   #TS=`date -u --rfc-3339=ns`
#   TS=`date -u -Ins`
#   #TS=`date -u -R`
#   echo $TS $HASH
#   sleep 4.995;
# done

# ctrl-c does not reach uvicorn in this setup
uvicorn app.main:app --host 0.0.0.0 --port 7777

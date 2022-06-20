#!/bin/bash

. ./hasher.sh

echo $HASH > app/files/hs.txt


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

# echo foo > app/files/bar

# (not "auto tuned", will inevitably drift..)
while true; do
  #TS=`date -u --rfc-3339=ns`
  TS=`date -u -Ins`
  #TS=`date -u -R`
  echo -n $TS > app/files/ts.txt
  sleep 4.995;
done

# uvicorn app.main:app --host 0.0.0.0 --port 7777

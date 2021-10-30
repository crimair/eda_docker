#!/bin/bash

USER_NAME=$LOCAL_USERNAME
USER_ID=$LOCAL_UID
GROUP_ID=$LOCAL_GID

useradd -u $USER_ID -o -M -d /home/$USER_NAME $USER_NAME
groupmod -g $GROUP_ID $USER_NAME
export HOME=/home/$USER_NAME

cd $CURRENT_PATH

exec /usr/local/bin/gosu $USER_NAME "$@"

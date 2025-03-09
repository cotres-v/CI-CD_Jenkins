#!/bin/bash

S21_CAT_PATH="${env.JENKINS_HOME}/jobs/${env.JOB_NAME}/lastBuild/archive/src/cat/s21_cat"
S21_GREP_PATH="${env.JENKINS_HOME}/jobs/${env.JOB_NAME}/lastBuild/archive/src/grep/s21_grep"

REMOTE_USER="viktor"           
REMOTE_HOST="192.168.1.74"   
REMOTE_DIR="/usr/local/bin"  

scp $S21_CAT_PATH $S21_GREP_PATH $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR

if [ $? -eq 0 ]; then
    echo "The artifacts were successfully copied to $REMOTE_HOST."
else
    echo "Error when copying artifacts."
    exit 1
fi
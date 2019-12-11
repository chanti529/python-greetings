#!/bin/sh

jfrog rt c --interactive=false \
  --url=http://${ARTY_HOST:-192.168.41.41}:${ARTY_PORT:-8081}/artifactory \
  --user=$ARTY_USER \
  --access-token=$ARTY_TOKEN \
$ARTY_ID

jfrog rt pipi -r requirements.txt --trusted-host ${ARTY_HOST:-192.168.41.41} \
  --build-name=$1 \
  --build-number=$2 \
  --module=$3

python setup.py sdist bdist_wheel

jfrog rt u dist/ $ARTY_MAIN_REPO/ 
  --build-name=$1 \
  --build-number=$2 \
  --module=$3

jfrog rt bce $1 $2

jfrog rt bp $1 $2

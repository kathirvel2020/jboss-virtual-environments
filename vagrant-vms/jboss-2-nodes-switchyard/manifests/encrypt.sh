#!/usr/bin/env bash

#
#
#
usage() {
   echo "$0 USER PASSWORD"
   echo "Will provide encrypted password"
   exit
}

[ $# -ne 2 ] && usage;

if [ -z $JBOSS_HOME ]
then
   echo "JBOSS_HOME is not set"
   exit 255
fi

_PATH=$(find $JBOSS_HOME/modules/system/layers/base/org/picketbox/main/ -regextype posix-extended -regex ".*picketbox-[[:digit:]].*")
CLASSPATH=$CLASSPATH:$_PATH:$JBOSS_HOME/bin/jboss-client.jar:.

java -cp $CLASSPATH EncryptPassword $*

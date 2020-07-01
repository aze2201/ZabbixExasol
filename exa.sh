#!/bin/bash


PYTHON_SCRIPT="/etc/zabbix/ExasolSQLPythonExecute/bin/mainscript.py"
BASEDIR=$(dirname "$0")
SCRIPT_PATH="$(pwd)/$BASEDIR"

SCRIT_NAME=`basename "$0"`
DIR=`dirname "$0"`
CONFIG_FILE="$SCRIPT_PATH/exa.ini"


SCRIPT_OUTPUT=$DIR/$(echo ${SCRIT_NAME} | sed 's/.sh//' ).output



main()
{  
   rm -rf $SCRIPT_OUTPUT
   $PYTHON_SCRIPT -c $CONFIG_FILE
   ## NORMALLY OUTPUT is comma separated. Please change column whatever you need. print $4 or print $5 etc. 
   result=$(cat $SCRIPT_OUTPUT| sed "s/'//g" | awk -v FS=',' '{print $4}')
   echo $result
}
main

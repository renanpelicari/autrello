#!/bin/bash

PROP_FILE="./application.properties"

# func to validate if property exists
validateProperty() {
    if [ -z "$1" ]; then
      echo "The property $1 not exists"
      exit
    fi
}

# func to get property from file
getProperty() {
    PROP=`cat "$PROP_FILE" | grep "$1" | cut -d'=' -f2`
    validateProperty "$PROP"
    echo "$PROP"
}

# check if properties file exists
if [ -f  "$PROP_FILE" ]; then

    # get trello key and token
    KEY=`getProperty "trello.key"`
    TOKEN=`getProperty "trello.token"`
    DEBUG_MODE=`getProperty "debug.mode"`

    # export token and key to use in any context of script (like global const)
    export KEY
    export TOKEN
    export DEBUG_MODE

    ./src/run.sh
else
  echo "The properties file [$PROP_FILE] not exists"

fi;


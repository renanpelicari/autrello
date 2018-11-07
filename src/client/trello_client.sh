#!/bin/bash
#######################################################
# Client to access trello api
# 
# API Docs: https://developers.trello.com/reference/#introduction  
#
#######################################################


API_URL="https://api.trello.com/1"
CONTEXT_USER_BOARDS="$API_URL/members/me/boards"

getUri() {
    URI="$1?key=$KEY&token=$TOKEN"
    echo "$2"
    # if [ -z "$2" ]; then
    #     URI="$URI&$2"
    # fi
    echo "$URI"
}

doRequest() {
    if [ "$DEBUG_MODE" == "true" ]; then
        echo "----------- debug --------------"
        echo "performing http(s) request"
        echo "FILE:     trello_client.sh"
        echo "FUNC:     doRequest()"
        echo "COMMAND:"
        echo "curl $1"
        echo "--------------------------------"
        echo ""
    fi

    BODY_RESPONSE="$(curl --silent $1)"  
    echo "Body response:"
    echo "$BODY_RESPONSE"
    echo ""
}

doGet() {
    doRequest "$1"
}

getBoards() {
    URI_BOARDS=`getUri "$CONTEXT_USER_BOARDS"`
    doGet "$URI_BOARDS"
}

getBoards
echo ""
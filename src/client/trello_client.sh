#!/bin/bash
#######################################################
# Client to access trello api
# 
# API Docs: https://developers.trello.com/reference/#introduction  
#
#######################################################


API_URL="https://api.trello.com/1"
CONTEXT_USER_BOARDS="$API_URL/members/me/boards"

FORMATTER_BOARDS='["BOARD_ID                 ","BOARD_NAME"], ["-------------------------","--------------------"], (.[] | [.id, .name]) | @tsv'

getUri() {
    URI="$1?key=$KEY&token=$TOKEN"
    echo "$2"
    # if [ -z "$2" ]; then
    #     URI="$URI&$2"
    # fi
    echo "$URI"
}

doRequest() {
    BODY_RESPONSE="$(curl --silent $1)"  
    echo "$BODY_RESPONSE"
}

doGet() {
    doRequest "$1"
}

# getFormattedResponse() {
#     FORMATTED_RESP=`echo $1 | \'$2\'`
#     echo $FORMATTED_RESP
# }

getBoards() {
    clear
    echo "ALL BOARDS:"
    echo "===================================================="
    URI_BOARDS=`getUri "$CONTEXT_USER_BOARDS"`
    RESPONSE=`doGet "$URI_BOARDS"`
    echo $RESPONSE | jq -r '["BOARD_ID                 ","BOARD_NAME"], ["-------------------------","--------------------"], (.[] | [.id, .name]) | @tsv'
}

case "$1" in
    get_boards)
        getBoards
        ;;
    post_card)
        BOARD_ID="$2"
        CARD_DESCRIPTION="$3"
        echo "BoardId: $BOARD_ID / $CARD_DESCRIPTION"
        echo "Need to be implemented"
        ;;
    *)
        echo $"Usage: $0 {get_boards|post_card}"
            exit 1
esac

echo ""
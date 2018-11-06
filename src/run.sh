#!/bin/bash

KEY=$1
TOKEN=$2

echo "KEY:   $KEY"
echo "TOKEN: $TOKEN"

getBoards() {
    curl "https://api.trello.com/1/members/me/boards?key=$KEY&token=$TOKEN"
}

getBoards
echo ""


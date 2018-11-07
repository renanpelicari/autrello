#!/bin/bash
#######################################################
# Main script to show menu and orchestrate trello api requests
#######################################################

clear
echo "#######################################################"
echo "AuTrello"
echo "  - use trello by Linux command line o/"
echo "#######################################################"
echo ""

if [ "$DEBUG_MODE" == "true" ]; then
    echo "----------- debug --------------"
    echo "FILE:     run.sh"
    echo "KEY:      $KEY"
    echo "TOKEN:    $TOKEN"
    echo "--------------------------------"
    echo ""
fi

./src/client/trello_client.sh

echo ""


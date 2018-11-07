#!/bin/bash
#######################################################
# Main script to show menu and orchestrate trello api requests
#######################################################

appHeader() {
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
}

appMenu() {
    echo "----------- menu --------------"
    echo "1 - Get Boards (show all your boards)"
    echo "2 - Show Cards By Board (show all cards based in your board id)"
    echo "3 - Register Card (register card in board with id)"
    echo "0 - Exit"
    echo "--------------------------------"
    echo "choose your destiny:"
    read DESTINY
    echo ""
}

appClose() {
    echo "...bye"
    echo ""
    exit 1
}

selectDestiny() {
    case "$DESTINY" in
        1)
            ./src/client/trello_client.sh get_boards
            ;;
        2)
            echo "missing implementation"
            ;;
        3)
            echo "missing request board id and description"
            ./src/client/trello_client.sh post_card
            ;;
        0)
            appClose
            ;;
        *)
            clear
            echo "Select one valid option from menu"
            echo ""
            appMenu
            ;;
    esac

}

start() {
    appHeader
    appMenu
    selectDestiny
}


start
appClose

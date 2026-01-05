#!/bin/bash

clear

echo "         __ _                        _ _ "
echo "        / _(_)                      | | |"
echo "  _   _| |_ _ _ __ _____      ____ _| | |"
echo " | | | |  _| | '__/ _ \\ \\ /\\ / / _\` | | |"
echo " | |_| | | | | | |  __/\\ V  V / (_| | | |"
echo "  \\__,_|_| |_|_|  \\___| \\_/\\_/ \\__,_|_|_|"
echo "                                           "
echo "               uFirewall Tool               "
echo "============================================"
echo ""

while true; do
    echo "1) Check UFW status & ports"
    echo "2) Open (ALLOW) a port"
    echo "3) Close (DENY) a port"
    echo "4) Exit"
    echo ""
    read -p "Select an option [1-4]: " choice
    echo ""

    case $choice in
        1)
            sudo ufw status verbose
            ;;
        2)
            read -p "Enter port number to OPEN: " port
            sudo ufw allow "$port"
            sudo ufw reload
            echo "Port $port is now ALLOWED"
            ;;
        3)
            read -p "Enter port number to CLOSE: " port
            sudo ufw deny "$port"
            sudo ufw reload
            echo "Port $port is now BLOCKED"
            ;;
        4)
            echo "Exiting uFirewall..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose 1-4."
            ;;
    esac

    echo ""
    read -p "Press Enter to continue..." temp
    clear
done

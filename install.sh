#!/bin/bash

# Initial action with curl (commented out since it's not used)
# echo "Running initial setup..."
# curl -s http://example.com/initial-setup-script.sh | bash

# Prompt the user for which panel to install
echo "Which panel would you like to install on your system?"
echo "1) cPanel"
echo "2) Plesk"
echo "3) DirectAdmin"
read -p "Enter the number of your choice: " choice

# Install the selected panel
case $choice in
    1)
        echo "Installing cPanel..."
        cd /home && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest
        ;;
    2)
        echo "Installing Plesk..."
        sh <(curl http://autoinstall.plesk.com/one-click-installer)
        ;;
    3)
        echo "Installing DirectAdmin..."
        wget -O setup.sh https://www.directadmin.com/setup.sh && chmod +x setup.sh && ./setup.sh
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "Panel installation completed!"

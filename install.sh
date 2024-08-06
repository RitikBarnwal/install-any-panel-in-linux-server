#!/bin/bash
cat <<EOF






_______________________________________________________
|  _______        _             _    _           _    |
| |__   __|      | |           | |  | |         | |   |
|    | | _____  _| |_ _ __ __ _| |__| | ___  ___| |_  |
|    | |/ _ \ \/ / __| '__/ _` |  __  |/ _ \/ __| __| |
|    | |  __/>  <| |_| | | (_| | |  | | (_) \__ \ |_  |
|    |_|\___/_/\_\\__|_|  \__,_|_|  |_|\___/|___/\__| |
|  ================================================== |
|  TextraHost - Server Management Solutions           |
|  Website: https://textrahost.com                    |
|  ================================================== |
|_____________________________________________________|
EOF



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
        
        # Install required packages
        yum install -y perl curl
        
        # Download and install cPanel
        cd /home
        curl -o latest -L https://securedownloads.cpanel.net/latest
        sh latest
        
        # Start NetworkManager and enable it to start on boot
        systemctl start NetworkManager
        systemctl enable NetworkManager
        
        echo "cPanel installation completed!"
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

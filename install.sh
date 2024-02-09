#!/bin/bash

# Update and upgrade packages
yes | apt update
yes | apt upgrade
yes | pkg update
yes | pkg upgrade

# Install wget, p7zip
yes | pkg install wget
yes | pkg install p7zip

# Download Fwifi.zip
wget https://github.com/mahendraplus/Fwifi/raw/Max/Fwifi.max

# Check if the file is downloaded successfully
if [ -f Fwifi.max ]; then
    # Rename the file to Fwifi.zip
    mv Fwifi.max Fwifi.zip

    # Prompt user for password
    read -p "Enter the password for unzip: " password

    # Unzip the file with the provided password using p7zip
    7z x Fwifi.zip -p"$password" -oFwifi

    # Check if unzip was successful
    if [ $? -eq 0 ]; then
        # Run install.sh
        bash Fwifi/install.sh
    else
        echo "Error: Unzip failed. Please check the password."
    fi
else
    echo "Error: File download failed."
fi
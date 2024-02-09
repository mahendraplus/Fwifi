#!/bin/bash

# Update and upgrade packages
apt update
apt upgrade
pkg update
pkg upgrade

# Install wget, unzip
pkg install wget
pkg install unzip

# Download Fwifi.zip
wget https://github.com/mahendraplus/Fwifi/raw/Max/Fwifi.max

# Check if the file is downloaded successfully
if [ -f Fwifi.max ]; then
    # Rename the file to Fwifi.zip
    mv Fwifi.max Fwifi.zip

    # Prompt user for password
    read -p "Enter the password for unzip: " password

    # Unzip the file with the provided password
    unzip -P "$password" Fwifi.zip -d Fwifi

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
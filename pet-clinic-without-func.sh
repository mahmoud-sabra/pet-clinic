#!/bin/bash

# Check if the user pet-clinic exists
if id "pet-clinic" &>/dev/null; then
    echo "User pet-clinic already exists."
else
    # If not, create a new functional user called pet-clinic
    sudo useradd -m pet-clinic
    echo "User pet-clinic created successfully."
fi

# Check if Java is installed

if ! /home/pet-clinic/java/bin/java --version &> /dev/null; then
    echo "Java is not installed. Downloading and installing..."

    # Check if the JDK package exists in the current directory
    if [ ! -f "/home/pet-clinic/jdk-22_linux-x64_bin.deb" ]; then
        # If the package doesn't exist, download it
        cd /home/pet-clinic
        wget https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.deb
    fi

    # Install Java JDK package
    dpkg -i /home/pet-clinic/jdk-22_linux-x64_bin.deb
    rm /home/pet-clinic/jdk-22_linux-x64_bin.deb  # Clean up downloaded package

    # Add Java bin directory to pet-clinic user's PATH
    echo 'export PATH="$PATH:/home/pet-clinic/usr/bin/java"' >> /home/pet-clinic/.bashrc
else
    echo "Java is already installed."
fi
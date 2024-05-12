#!/bin/bash
  
# Check if the user pet-clinic exists
if id "pet-clinic" &>/dev/null; then
    echo "User pet-clinic already exists."
else
    # If not, create a new functional user called pet-clinic
    sudo useradd -m pet-clinic
    echo "User pet-clinic created successfully."
    sudo passwd pet-clinic
fi

# Check if Java is installed
if ! /home/pet-clinic/jdk-22.0.1/bin/java --version &> /dev/null; then
    echo "Java is not installed. Downloading and installing..."

    # Check if the JDK package exists in the current directory
    cd /home/pet-clinic
    wget https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.tar.gz
    tar -xf jdk-22_linux-x64_bin.tar.gz

    # Add Java bin directory to pet-clinic user's PATH
    echo 'export PATH="$PATH:/home/pet-clinic/jdk-22.0.1/bin"' >> /home/pet-clinic/.bashrc
else
    echo "Java is already installed."
fi

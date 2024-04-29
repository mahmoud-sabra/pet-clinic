#! /bin/bash 
# Define variables
username="pet-clinic"
jdk_url="https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.deb"
jdk_deb_path="/home/$username/jdk-*.deb"
# Function to create a user if it does not exist
create_user() {
    if id "$username" &>/dev/null; then
        echo "User $username already exists. No need to create."
    else
        useradd -m -d /home/$username -s /bin/bash $username
        echo "User $username created."
        read -p "Please enter a password for $username: " password
        echo "$username:$password" | chpasswd
        echo "Password set for $username."
    fi
}


# Function to download and install Java in the user's home directory
install_java() {
        java_home="/home/$username/java"
    # Create a java directory if it doesn't exist
     if [ ! -d "$java_home" ]; then
        mkdir "$java_home"
        chown "$username":"$username" "$java_home"
        echo "Java directory created at $java_home."
     fi



    # Download Java JDK if the deb file does not exist
    if [ ! -f "$jdk_deb_path" ]; then
        echo "Downloading Java JDK from $jdk_url..."
        cd $java_home
        wget  $jdk_url
        if [ $? -ne 0 ]; then
          echo "Failed to download Java JDK."
          exit 1

        else
         echo "Download complete."
        fi
    fi

    # Install Java JDK if not already installed

    if which java >/dev/null; then 
        dpkg -i *.deb   

    fi

    # Set JAVA_HOME and add java to PATH in the user's .bashrc if not already done
    grep -qxF 'export JAVA_HOME='"$java_home" /home/$username/.bashrc || {
        echo 'export JAVA_HOME='"$java_home" >> /home/$username/.bashrc
        echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /home/$username/.bashrc
        echo "JAVA_HOME and PATH updated in .bashrc."
    }
}
check_java_installation() {
    if which java >/dev/null; then
        echo "Java JDK is installed."
    else
        echo "Java JDK is not installed."
    fi
}

# Calling Function
create_user
install_java
check_java_installation
# Pet Clinic User and Java Installation Script

This script automates the setup of a new user named `pet-clinic` and installs Java on the system without root access. It ensures that the Java environment is configured properly for the `pet-clinic` user.

## Instructions

1. **Download the Script:**
   - Download the `pet-clinic.sh` script to your desired location.

2. **Make the Script Executable:**
   - Run the following command to make the script executable:
     ```bash
     chmod +x pet-clinic.sh
     ```

3. **Run the Script:**
   - Execute the script using the following command:
     ```bash
     ./pet-clinic.sh
     ```

4. **Follow On-Screen Instructions:**
   - The script will check if the `pet-clinic` user exists.
   - If the user doesn't exist, it will create a new user.
   - You will be asked to enter password for a new user
   - It then checks if Java is installed for the `pet-clinic` user.
   - If Java is not installed, it will download and install Java in the user's home directory.

5. **Verify Installation:**
   - Once the script completes successfully, verify that Java is installed by logging in as the `pet-clinic` user and running `java -version`.

## Notes

- This script requires `sudo` privileges to create the `pet-clinic` user and download Java.
- Ensure that the script is executed in an environment with internet access to download the Java JDK.
- The script is designed to be rerunnable 

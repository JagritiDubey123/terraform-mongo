# #!/bin/bash
# apt-get update
# apt-get install -y ansible

#!/bin/bash

# Update system packages
sudo apt update
sudo apt upgrade -y

# Import the MongoDB public GPG key
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

# Create a list file for MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Reload the local package database
sudo apt update

# Install MongoDB packages
sudo apt install -y mongodb-org

# Start and enable MongoDB service
sudo systemctl start mongod
sudo systemctl enable mongod

# Verify the installation
sudo systemctl status mongod


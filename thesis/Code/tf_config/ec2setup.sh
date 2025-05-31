#!/bin/bash
# Install required packages for Docker Compose in EC2 virtual machine noninteractively
sudo apt-get -y update
sudo apt-get -y install ca-certificates curl openssl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Create Home Assistant container and encryption folder
sudo mkdir -p /home/admin/homeassistant
sudo mkdir -p /home/admin/homeassistant/ssl
# Create encryption key
sudo openssl req -x509 -nodes -newkey rsa:2048 -keyout privkey.pem -out cert.pem -days 365
sudo mv privkey.pem cert.pem home/admin/homeassistant/ssl/

# Create Docker Compose config file for HA container part of the network 
cat > /home/admin/homeassistant/docker-compose.yml << EOF
services:
  homeassistant:
    container_name: home-assistant
    image: ghcr.io/home-assistant/home-assistant:stable
    volumes:
      - ./config:/config
      - ./ssl:/ssl
    ports:
      - "8123:8123"
    network_mode: host
EOF

# Start Home Assistant service
cd /home/admin/homeassistant
sudo docker compose down
sudo docker compose up -d
#!/bin/bash
# ==================================================
# ORACLE-WIREGUARD-VPN INSTALLATION LOGIC BELOW
# ==================================================

echo "Step 1: Updating System & Installing WireGuard..."
sudo apt update && sudo apt upgrade -y

sudo apt install wireguard qrencode -y


echo "Step 2: Enabling IPv4 Packet Forwarding..."
# This allows the server to act as a router for your VPN traffic
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p


echo "Step 3: Configuring Local Firewall (UFW)..."

sudo ufw allow 51820/udp
sudo ufw allow 22/tcp
sudo ufw --force enable

echo "DONE: Infrastructure is ready for wireguard.conf." 



# --- System Prep ---

echo "Updating Oracle Linux/Ubuntu..."
sudo apt update && sudo apt upgrade -y

# --- WireGuard Core ---

echo "Installing WireGuard and Networking Tools..."
sudo apt install wireguard qrencode -y

# --- The Router Logic ---

echo "Enabling IPv4 Forwarding in the Kernel..."
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# --- Firewall Check ---

echo "Configuring Local UFW Firewall..."
sudo ufw allow 51820/udp
sudo ufw allow 22/tcp
sudo ufw --force enable

echo "Infrastructure is ready."
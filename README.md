# ORACLE-WIREGUARD-VPN 

A high-performance, private VPN tunnel deployed on **Oracle Cloud Infrastructure (OCI) using the **WireGuard** protocol.

## Phase 1: Oracle Cloud Infrastructure (OCI) Setup
    before installing the software, I architected the following cloud environment:

### 1. Networking (VCN) 
* **VCN:** Created a Virtual Cloud Network with an **Internet Gateway**.
* **Subnets:** Provisioned a **Public Subnet** to allow external encrypted handshakes.
* **Static IP:** Promoted the Ephemeral IP to a **Reserved Public IP**  To ensure a permanent VPN Endpoint.

### 2. Security Lists (The Hardware Firewall)
Oracle blocks all traffic by default. I manually configured these **Ingress Rules**:
| Protocol | Port | Source | Purpose |
| :--- | :--- | :--- | :--- |
| **UDP** | `51820` | `0.0.0.0/0` | WireGuard Handshake |
| **TCP** | `22` | `My_Home_IP` | Secure SSH Management |

### 3. Compute Shape
* **Instance:** `VM.Standard.A1.Flex` (ARM Ampere).
* **Specs:** 1 OCPU / 6GB RAM (OCI Always Free).



# ORACLE-WIREGUARD-VPN

## 🏗️ Phase 1: Oracle Cloud Infrastructure (OCI) Setup
Before running any scripts, the cloud environment was manually architected:

1. **Virtual Cloud Network (VCN):** - Provisioned a VCN with an **Internet Gateway** to allow public traffic.
   - Configured a **Regional Public Subnet** for the VPN instance.
2. **Security Lists (Cloud Firewall):**
   - **Ingress Rule:** Opened `UDP 51820` to `0.0.0.0/0` (Critical for WireGuard).
   - **Ingress Rule:** Opened `TCP 22` for SSH management.
3. **Static Networking:**
   - Assigned a **Reserved Public IP** so the VPN endpoint never changes. !


## 🔍 Deep Dive: Understanding the Config 

### 📖 Technical Glossary Term Category What it actually means

Masquerade      Networking  The "Invisibility Cloak." Replaces your phone's IP with the Server's Public IP.

eth0            Hardware                    The physical internet card of the Oracle VM.    

wg0             Software                         The virtual encrypted "Tunnel" interface
.CIDR           Networking                 (e.g., /24 or /32) Defines how many devices can stay on the network.

VCN	              Cloud	                            Virtual Cloud Network. Your private "slice" of the Oracle Data Center.

Ingress Rule	    Security	            An "Incoming" firewall rule. We used this to open port 51820.

Egress Rule	        Security	            An "Outgoing" firewall rule. This lets your VPN talk to the rest of the internet.

Endpoint	        Networking	                The Public IP address of your Oracle Server where the VPN connects.

IPv4 Forwarding	     Kernel	                    'The "Switch" inside Linux that allows it to act like a router instead of just a PC.

NAT / Masquerade	 Networking	               'The process of hiding your phone's private IP and replacing it with the Server's Public IP.

Handshake	        Security	            'The split-second moment your phone and server exchange keys to start the encrypted session.


CIDR (10.0.0.1/24)	    Networking	        'A way to define a range of IP addresses. /24 means "This whole local network."



## How to Use This Repo
Provision your Oracle ARM Instance.

Open UDP Port 51820 in the OCI Console.

Run the script: chmod +x setup.sh && ./setup.sh.

Configure your wg0.conf using the provided template.

[!TIP]
Always verify your physical interface name. While usually eth0, some Oracle shapes use ens3. Use ip addr to check!


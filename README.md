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

### Terms
%i                              This is a variable that stands for the interface name (usually wg0).


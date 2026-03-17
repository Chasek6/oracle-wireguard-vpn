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
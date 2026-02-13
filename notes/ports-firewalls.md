**Questions to answer:**

## 1. What is a port? Why do they exist?
Ports are 16-bit unsigned integers, ranging from 0 to 65,535, that are used by protocols like TCP (Transmission Control Protocol) and UDP (User Datagram Protocol) to direct data to the correct service.

Ports exist to solve the problem of managing multiple, simultaneous, and varied network connections on a single device. Without ports, a computer would not know whether incoming data is for a web browser, an email client, or a file transfer. 

## 2. What is the difference between a port and an IP address?
An IP address identifies a specific device (host) on a network, while a port number identifies a specific process, application, or service running on that device.

## 3. Memorize these common ports (you'll use them constantly):
Knowledge of standard ports is essential for configuring Security Groups and Firewalls. Below are the key services utilized in this lab environment:

| Port | Service | Description |
| :--- | :--- | :--- |
| **22** | SSH | Remote terminal access and Git operations. |
| **80** | HTTP | Unencrypted web traffic. |
| **443** | HTTPS | Encrypted web traffic (TLS). |
| **3306** | MySQL | Relational database access. |
| **5432** | PostgreSQL | Relational database access. |
| **6379** | Redis | In-memory caching service. |
| **27017** | MongoDB | NoSQL document database. |
| **8080** | HTTP Alt | Alternative web port / Jenkins / Dev servers. |


## 4. What is a firewall? What problem does it solve?
A firewall is a network security system—available as hardware, software, or a cloud service—designed to monitor, filter, and control incoming and outgoing network traffic based on a set of predetermined security rules. 
Without a firewall, a computer or network is directly exposed to the entire internet, making it highly vulnerable to cyberattacks.

## 5. What is the difference between inbound and outbound rules?
Inbound rules control traffic entering a network or device from external sources, primarily protecting against unauthorized access, while outbound rules control traffic leaving a network or device to external destinations, often restricting unauthorized data exfiltration.

## 6 What does "deny all, allow specific" mean? Why is this better than "allow all, deny specific"?
It is a system blocks all incoming and outgoing traffic by default and only permits connections that are explicitly defined in the security policy. 
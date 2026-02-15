# Docker Networking Lab Notes

## What I Learned

### 1. Docker Networks
A Docker network is the virtual infrastructure that allows containers to communicate with one another. Think of the containers as rooms in a house; the Docker network is the hallway and intercom system that connects them. Without this network, containers remain isolated islands.

### 2. Custom Subnets
We manually defined the 10.0.0.0/24 subnet instead of letting Docker auto-assign one. This gives us control over our infrastructure. In production, you want to know exactly which IP range your services occupy to avoid conflicts with other networks.

### 3. Static IP Assignment
Dynamic IP (Default): Docker assigns the next available address when a container starts. If the container restarts, that IP might change, breaking connections.

Static IP (--ip flag): We manually "pin" an address (like 10.0.0.10) to a container. This ensures that our "client" always knows exactly where to find the "server."

### 4. Docker DNS
Docker includes a built-in DNS Service. This allows us to use container names (like ping server) instead of memorizing IP addresses. It’s much easier to maintain a system that refers to a service by its name rather than a string of numbers that might change.

### 5. Linux Capabilities
This was a major takeaway: Being root does not mean you have total power. Docker uses "Capabilities" to strip away high-level privileges for security. We needed --cap-add=NET_ADMIN to give our container the specific authority to modify the Linux kernel's network stack.

### 6. iptables Firewall
The firewall is like a bouncer in a party, allows VIP guests on the VIP list but blocks everyone who is not on the list. The default drop + specific allow is better the default accept because you dont want to give everyone and just anyone access, it is more secure and safe. This "Least Privilege" approach is the gold standard for DevOps security.

## Commands I Used
docker exec -it <name> bash: Opens an interactive terminal inside a running container.

docker ps: Lists all active containers, their IDs, and status.

iptables -L -v -n: Lists all active firewall rules with detailed packet counts and numeric IP addresses.

apt-get update && apt-get install: Used to install missing tools like ping and iptables in minimalist images.

## Key Insights
The most surprising discovery was Linux Capabilities. It is incredible how Docker prioritizes security by restricting the root user. Learning that iptables -L would fail with a "Permission Denied" error—even for root—really drove home the concept of container isolation. It makes me realize that as a DevOps engineer, my job isn't just to make things work, but to make them work securely.
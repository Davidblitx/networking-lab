# 2-Container Network Lab

## Objective
Set up isolated network with 2 containers, configure firewall rules, 
test connectivity.

## Network Design
- Network: 'lab-network' (10.0.0.0/24)
- Server container: nginx on 10.0.0.10
- Client container: Ubuntu on 10.0.0.20

## Setup Commands
List networks: docker network ls
Check container status: docker ps
Verify static IPs: docker inspect server | grep IPAddress

## Connectivity Tests
Initial tests confirmed that both containers could communicate via IP and Docker's internal DNS:

Ping: client -> server (10.0.0.10) Success

Curl: client -> server (HTTP 80) Success (Status 200 OK)

## Firewall Configuration
I configured iptables inside the server container to enforce a Zero-Trust policy:

Result: After implementation, curl remained successful, but ssh and ping timed out as expected.

## Key Learnings
Docker DNS: I was surprised that containers on a custom network can talk to each other using their names (e.g., curl http://server) without needing to know the IP address.

Capabilities: I learned that even as root, a container cannot touch its own network stack unless launched with --cap-add=NET_ADMIN.

Layered Security: Configuring a firewall inside a container adds an extra layer of "Defense in Depth" beyond just network isolation.

## Troubleshooting
Permission Denied: Encountered iptables: Permission denied because containers are unprivileged by default. Solved by recreating the container with the NET_ADMIN capability.

Command Not Found: Initially tried running docker commands inside the container. Realized I must run Docker management commands from the WSL host, not the container shell.

Apt-Get Hang: apt-get update hung after setting the firewall to DROP. Solved by temporarily setting the policy to ACCEPT to allow the initial package downloads.


## Quick Rebuild Commands

For recreating this lab from scratch:

# Create network
docker network create --driver bridge --subnet 10.0.0.0/24 lab-network

# Launch server (with NET_ADMIN for firewall)
docker run -d --name server --network lab-network --ip 10.0.0.10 \
  --cap-add=NET_ADMIN nginx:latest

# Launch client
docker run -d --name client --network lab-network --ip 10.0.0.20 \
  ubuntu:latest tail -f /dev/null

# Configure server firewall
docker exec -it server bash -c "
  apt-get update && apt-get install -y iptables &&
  iptables -P INPUT DROP &&
  iptables -P FORWARD DROP &&
  iptables -P OUTPUT ACCEPT &&
  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT &&
  iptables -A INPUT -p tcp --dport 80 -j ACCEPT &&
  iptables -L -v -n
"

# Test from client
docker exec -it client bash -c "
  apt-get update && apt-get install -y curl iputils-ping &&
  ping -c 3 server &&
  curl http://server
"


**Cleanup:**

docker stop server client
docker rm server client
docker network rm lab-network


## Quick Rebuild Commands

# Create network
docker network create --driver bridge --subnet 10.0.0.0/24 lab-network

# Launch server with NET_ADMIN capability
docker run -d --name server --network lab-network --ip 10.0.0.10 \
  --cap-add=NET_ADMIN nginx:latest

# Launch client
docker run -d --name client --network lab-network --ip 10.0.0.20 \
  ubuntu:latest tail -f /dev/null

# Configure firewall on server
docker exec -it server bash -c "
  apt-get update && apt-get install -y iptables &&
  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT &&
  iptables -A INPUT -p tcp --dport 80 -j ACCEPT &&
  iptables -P INPUT DROP &&
  iptables -P FORWARD DROP &&
  iptables -P OUTPUT ACCEPT
"

# Install tools on client and test
docker exec -it client bash -c "
  apt-get update && apt-get install -y curl iputils-ping &&
  curl http://server &&
  ping -c 3 server
"

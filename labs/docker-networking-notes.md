# Docker Networking Lab Notes

## What I Learned

### 1. Docker Networks
A docker network is a network that allows docker container to communicate with each other. In a house you have rooms(containers), the systems that allows them connect to each other is called a docker network.

### 2. Custom Subnets
10.0.0.0/24 was used instead of docker auto-assigning subnets because we want to control IP range not docker.

### 3. Static IP Assignment
Difference between static IP (--ip flag) and dynamic IP is that the we add our own static IP while the dynamic is default.

### 4. Docker DNS
We can use "server" instead of "10.0.0.10" because docker also uses the names of the container not just the ip address. 

### 5. Linux Capabilities

We needed '--cap-add=NET_ADMIN' because in docker despite running as root does not have all the capabilities.

### 6. iptables Firewall

[Explain what the firewall does and why default DROP + specific ALLOW is better than default ACCEPT] The firewall is like a bouncer in a party, allows VIP guests on the VIP list but blocks everyone who is not on the list. The default drop + specific allow is better the default accept because you dont want to give everyone and just anyone access, it is more secure and safe.

## Commands I Used

'docker exec -it <name> bash' - I used this command to run the docker container.
'docker ps' - to check running docker processes.
'iptables -L -v -n' - to list aa the rules, packets of the iptables.

## Key Insights
I was suprised at the 'linux capabilities', the fact that even when you are root, you still dont have all the priviledge to run certain commands like 'iptables -L -v -n' you need the NET_ADMIN to do so, it is just really incredible how docker priorities security. 
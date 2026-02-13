**Questions to answer:**

## 1. What is a Docker network? How is it different from your host network?
A Docker network is a virtual private network interface created by docker to allow containers communicate with each other and the outside world.

A docker network is different from a host network in that while a docker etwork usually provides a layer of separation, the host networking driver allows a container to skip that, connecting it directly to the docker host's networking.

## 2. What are the different Docker network types? (bridge, host, none)
Bridge: This is the default network driver. It creates a private internal network using a virtual bridge (e.g., docker0) for containers on a single host.

Host: This driver removes network isolation between the container and the Docker host.

None: This network driver completely isolates a container from all other networks.

## 3. What does docker network create do?
The docker network create command is used to create a new, user-defined virtual network within Docker. This allows for better isolation, control, and automatic service discovery for containers, which is a key practice for building complex, multi-container applications. 

## 4. How do containers on the same network communicate?
Containers on the same docker network communicate primarily through a virtual bridge network (commonly docker0 or a user-defined bridge), which acts as a virtual switch connecting them. Within this network, containers can interact using their internal IP addresses or via service discovery using container names, allowing them to share data without exposing ports to the host. 

## 5. What is the docker exec command used for?
The docker exec command is used to run a new command inside an already running docker container without stopping or restarting the container.  

## 6. How do you assign a static IP to a container?
Assigning a static IP to a Docker container requires creating a custom bridge network with a defined subnet and then specifying the IP address during container creation. This method ensures the container retains the same IP across restarts. 

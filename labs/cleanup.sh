#!/bin/bash

echo "Stopping containers..."
docker stop server client

echo "Removing containers..."
docker rm server client

echo "Removing custom network..."
docker network rm lab-network

echo "Cleanup complete! System is fresh."

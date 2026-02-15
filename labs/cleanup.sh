#!/bin/bash

echo "=== Stopping Containers ==="
docker stop server client 2>/dev/null || echo "Containers already stopped"

echo "=== Removing Containers ==="
docker rm server client 2>/dev/null || echo "Containers already removed"

echo "=== Removing Network ==="
docker network rm lab-network 2>/dev/null || echo "Network already removed"

echo "=== Verifying Cleanup ==="
echo "Remaining containers:"
docker ps -a | grep -E "server|client" || echo "None"

echo "Remaining networks:"
docker network ls | grep lab-network || echo "None"

echo "=== Cleanup Complete ==="

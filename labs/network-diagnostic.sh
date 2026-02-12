#!/bin/bash

echo "=== NETWORK INTERFACES ==="
ip addr show | grep "inet "
echo ""
echo "=== TEST CONNECTIVITY ==="
ping -c 3 google.com
echo ""
ping -c 3 cloudflare.com
echo ""
ping -c 3 github.com
echo ""
echo "=== DNS RESOLUTION ==="
dig google.com | grep "Query time"
echo ""
dig cloudflare.com | grep "Query time"
echo ""
dig github.com | grep "Query time"
echo ""
echo "=== OPEN PORTS ==="
sudo ss -tuln
echo ""
echo "=== SPECIFIC REMOTE PORTS ==="
echo "Checking Google HTTPS (433)..."
nc -zv google.com 443 2>&1 | grep "succeeded"
echo "Checking Github SSH (22)..."
nc -zv github.com 22 2>&1 | grep "succeeded"
echo ""
echo "=== SUMMARY REPORT ==="
echo "Diagnostic completed at: $(date)"
ip route get 1.1.1.1 | awk '{print $7}'
echo "Network status: Check logs above for details."


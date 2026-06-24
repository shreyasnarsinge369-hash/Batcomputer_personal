#!/bin/bash
# BatComputer Health Check
# Run from WSL2 Ubuntu

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "🦇 BatComputer Status Check"
echo "================================"

# Get Windows host IP from WSL2
HOST_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
echo "Windows Host IP (from WSL2): $HOST_IP"
echo ""

# Check Ollama via localhost (Windows-side check won't work from WSL)
echo "Checking Ollama API..."
if curl -s "http://${HOST_IP}:11434/api/tags" > /dev/null 2>&1; then
    echo -e "${GREEN}✓ Ollama is reachable at ${HOST_IP}:11434${NC}"
    echo "Models available:"
    curl -s "http://${HOST_IP}:11434/api/tags" | python3 -c "
import json, sys
data = json.load(sys.stdin)
for m in data.get('models', []):
    print(f\"  - {m['name']} ({round(m['size']/1e9, 1)}GB)\")
"
else
    echo -e "${RED}✗ Ollama not reachable at ${HOST_IP}:11434${NC}"
    echo -e "${YELLOW}  → Make sure Ollama is running on Windows${NC}"
    echo -e "${YELLOW}  → Make sure OLLAMA_HOST=0.0.0.0 is set on Windows${NC}"
fi

echo ""
echo "================================"
echo "Done."

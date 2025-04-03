#!/bin/bash

python changelog.sh
bash git.sh

# Clean up previous build artifacts
echo -e "${BLUE}Cleaning previous build artifacts...${NC}"

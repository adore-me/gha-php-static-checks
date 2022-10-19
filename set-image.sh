#!/bin/bash

# Colors
RD='\033[0;31m'
GR='\033[0;32m'
YL='\033[0;33m'
BL='\033[0;34m'
NC='\033[0m'

ACTION_IMAGE=""
if [ -n "$PROJECT_IMAGE" ]; then
  echo -e "${BL}Info:${NC} Project image found in env var PROJECT_IMAGE: ${GR}$PROJECT_IMAGE${NC}"
  ACTION_IMAGE="$PROJECT_IMAGE"
fi

if [ -n "$INPUT_PHP_IMAGE" ]; then
  echo -e "${BL}Info:${NC} Project image found in input. Using ${GR}$PROJECT_IMAGE${NC}"
  ACTION_IMAGE="$INPUT_PHP_IMAGE"
fi

if [ -z "$ACTION_IMAGE" ]; then
  echo "::error::No image provided"
  exit 1
fi

echo "php-image=$ACTION_IMAGE" >> "$GITHUB_OUTPUT"

#!/bin/bash
# Author: Marcus Burghardt
# marcus.apb@gmail.com
#
# A simple example of colored output

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "\t${RED}RED_TEXT${NC}"
echo -e "\t${GREEN}GREEN_TEXT${NC}"

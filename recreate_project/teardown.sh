#!/bin/bash

# Stop/remove containers
cd ~/final_project && docker-compose down

# Remove images
docker rmi postgres:14 mageai/mageai:latest
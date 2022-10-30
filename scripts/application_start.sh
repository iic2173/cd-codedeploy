#!/bin/bash
cd /home/ubuntu/api

echo "Starting Service... :)"
docker compose up -d --build

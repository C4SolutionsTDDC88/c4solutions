#!/bin/bash
docker-compose down
docker-compose kill
docker rm $(docker ps -a -q) -f
docker volume prune -f

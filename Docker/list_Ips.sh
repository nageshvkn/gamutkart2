#!/bin/bash
docker ps |  awk '{print $NF}' | tr -d 'NAMES' | xargs docker inspect --format {{.NetworkSettings.Networks.bridge.IPAddress}}

#!/bin/bash 

docker run \
    --restart=always \
    -d -p 3000:3000 \
    --env-file .env \
    --name nostr-relay-sqlite "nostr-relay-sqlite:$(git log -1 --pretty=%h)"

# Auto Updating Photon OS Roon Server Docker 

## I apologize for not being a true fork. I needed to make a clean repo so scheduling would work.

*Thank you to [David Ferreira](https://github.com/davindisko) for their wonderful container.*

**The primary difference with my container is an automated Github action that will rebuild it on the 1st of the Month at Midnight EST/1 AM EDT to ensure all dependencies are always up to date.**

***If this breaks your Roon install, I take no resposibility, I forked this repo for my own personal use. If you come across this feel free to use it, but I reserve the right to play around and break things from time to time. This is mostly meant to be set and forget with a monthly update.***

This also would not be possible without the work of [Steef de Bruijn](https://github.com/steefdebruijn).

The rest of this readme is from the original readme minus modifications to the `docker run` commmand
 
# Docker for Roon using Photon OS

Docker container for [Roon], based on Photon OS linux
Based on the great work of [steefdebruijn] who did the same based on a debian-slim image.
All informations to troubleshoot your linux server can be found [here]

## Differences
- ffmpeg is installed manually from official sources
- Uses local volumes for app, data, music and backups folders

## Steps
- First clone the repo
- Change TZ param in docker-compose.yaml
- Uncomment privileged if you encounter problems with network mounts

## Run container with docker compose
```sh
docker-compose up -d
```

## Run container
```sh
docker run -d \
  --net=host \
  -e TZ="America/New_York" \
  -v ./app:/app \
  -v ./data:/data \
  -v ./music:/music \
  -v ./backups:/backup \
  mackid1993/docker-roonserver:latest
```

[steefdebruijn]: <https://github.com/steefdebruijn/docker-roonserver>
[roon]: <https://roonlabs.com>
[here]: <https://help.roonlabs.com/portal/en/kb/articles/linux-install>

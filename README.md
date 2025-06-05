# Auto Updating Photon OS Roon Server Docker 

Docker Hub: https://hub.docker.com/r/mackid1993/docker-roonserver/

## For Unraid Users
This is a drop-in replacement for the [current](https://forums.unraid.net/topic/129853-support-xthursdayx-roonserver/) template, simply point Unraid's docker manager to `mackid1993/docker-roonserver:latest`. As of June 2025 this is also now available on Community Applications you may find the dedicated support thread [here](https://forums.unraid.net/topic/190570-support-roonserver-photon-os/).

## To Switch to Early Access
Create a container variable called `ROON_SERVER_URL` set it to `https://download.roonlabs.net/builds/earlyaccess/RoonServer_linuxx64.tar.bz2`.
Then with the container stopped delete /app and restart to download the EA build. To switch back to production: with the container stopped, remove that container variable, delete /app, and start the container.

## I apologize for not being a true fork. I needed to make a clean repo so scheduling would work.
This is based off of [davidsinko/docker-roonserver](https://github.com/davindisko/docker-roonserver).

*Thank you to [David Ferreira](https://github.com/davindisko) for their wonderful container.*

**The primary difference with my container is an automated Github action that will rebuild it on the 1st of the Month at Midnight EST/1 AM EDT to ensure all dependencies are always up to date.**

***If this breaks your Roon install, I take no resposibility, I created this repo for my own personal use. Please make sure you take regular backups of your Roon database no matter what. If you come across this feel free to use it. I don't intend to touch this unless something breaks. Docker Hub will save the last 3 tags, so if something does break, revert to the last known working tag until it can be fixed. I use Roon every single day so if there is a major issue I would likely notice as I have skin in the game as a lifetime license holder. This is mostly meant to be set and forget with a monthly update.***

This also would not be possible without the work of [Steef de Bruijn](https://github.com/steefdebruijn).
 
The rest of this readme is from the original readme minus modifications to the `docker run` commmand.


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

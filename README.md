# RoonServer Docker (Photon OS)

Docker Hub: https://hub.docker.com/r/mackid1993/docker-roonserver/

## For Unraid Users
This is a drop-in replacement for the [current](https://forums.unraid.net/topic/129853-support-xthursdayx-roonserver/) template, simply point Unraid's docker manager to `mackid1993/docker-roonserver:latest`. As of June 2025 this is also now available on Community Applications, you may find the dedicated support thread [here](https://forums.unraid.net/topic/190570-support-roonserver-photon-os/).

## To Switch to Early Access
Create a container variable called `ROON_SERVER_URL` set it to `https://download.roonlabs.net/builds/earlyaccess/RoonServer_linuxx64.tar.bz2`.
Then with the container stopped delete /app and restart to download the EA build. To switch back to production: with the container stopped, remove that container variable, delete /app, and start the container.

## Differences Between steefdebruijn/docker-roonserver
- This container uses Photon OS instead of Debian Slim (https://vmware.github.io/photon/). Photon OS is extremely lightweight and many in the Roon community have found that resource usage (particularly memory) is much lower with Photon OS than with Debian Slim.

- A new image will be pushed on the first of every month using GitHub Actions, this happens roughly at 12 a.m. EST or 1 a.m. EDT. As of June 2025 steefdebruijn/docker-roonserver has not been updated since 2023 which means vulnerabilities haven't been patched, and dependencies are out of date. However, this means that this container may also potentially break things as it is being updated more frequently. It's a trade-off between greater security and potentially causing compatibility issues if one of the dependencies causes an issue with Roon. If you are using Roon ARC, and have a port open on your router, it is a good idea to have the container up to date with the latest security fixes.

- This container also uses the [latest FFmpeg version available from the master branch](https://github.com/BtbN/FFmpeg-Builds/releases/tag/latest) at the time it was pushed. This ideally allows for the latest bug fixes and features in FFmpeg to be made available. However, given that it's the latest version, there is a possibility that there could be a bug introduced by the FFmpeg developers.

Both philosophies obviously have trade-offs, and I want to make that clear here before anyone chooses to use this container.

***
I apologize for not being a fork of https://github.com/davindisko/docker-roonserver. I needed to make my own repo so Github scheduling would work for automated builds.
This is based off of [davidsinko/docker-roonserver](https://github.com/davindisko/docker-roonserver).

**Disclaimer:**
*If this breaks your Roon install, I take no resposibility, I created this repo for my own personal use and decided to make it available to the community. Please make sure you take regular backups of your Roon database no matter what. I don't intend to touch this unless something breaks. Docker Hub will save the last 3 tags, so if something does break, revert to the last known working tag until it can be fixed. I use Roon every single day so if there is a major issue I would  notice as I am a Roon lifetime license holder. This is mostly meant to be set and forget with a monthly update. It's important to know that due to frequent updates this container may be more bleeding edge than other options, so take that into account when choosing to use it.*

This  would not be possible without the work of [Steef de Bruijn](https://github.com/steefdebruijn) and [David Ferreira](https://github.com/davindisko) for their wonderful containers that this is derived from. David's discovery of Photon OS for this purpose is a major breakthrough for running RoonServer on Docker.
 
The rest of this readme is from the original readme minus modifications to the `docker run` commmand.


## Steps to Run
- First clone the repo
- Change TZ param in docker-compose.yaml
- Uncomment privileged if you encounter problems with network mounts.

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
[davindisko]: <https://github.com/davindisko/docker-roonserver>
[roon]: <https://roonlabs.com>

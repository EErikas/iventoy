# iVentoy Docker Container

This project provides a Dockerized version of [iVentoy](https://www.iventoy.com/en/index.html), a PXE server for booting ISO files over the network. 

## Important Notes
- This is only a wrapper for the iVentoy software to run inside docker container. I not related to the iVentoy project.
- Currently `iVentoy` only supports `x64` platform, therefore there is only a docker image for `linux/amd64`. 

## Usage
You can run the container with Docker by using the following command:
```bash
docker run -d \
  --privileged \
  -e AUTOSTART=true \
  -p 26000:26000 \
  -p 16000:16000 \
  -p 10809:10809 \
  -p 69:69/udp \
  -p 67:67/udp \
  -p 68:68/udp \
  -v $(pwd)/iventoy/data:/iventoy/data \
  -v $(pwd)/iventoy/iso:/iventoy/iso \
  -v $(pwd)/iventoy/log:/iventoy/log \
  -v $(pwd)/iventoy/user:/iventoy/user \
  ghcr.io/eerikas/iventoy:latest
```

There is also a sample compose file in the repository

### Directory Structure

- `iventoy/data` - Persistent data storage
- `iventoy/iso` - Place your ISO images here
- `iventoy/log` - Log files
- `iventoy/user` - User configuration

### Environment Variables

- `AUTOSTART` (default: `false`): Set to `true` to start iVentoy automatically with the `-R` flag.

### Ports

- `26000` - Web management interface
- `16000` - iVentoy PXE Service HTTP Server
- `10809` - NBD Server
- `69/udp` - TFTP
- `67,68` - DHCP. Optional, only need to be exposed if you plan to use this container as a DHCP server on your network.


## Development

- The build process is automated via GitHub Actions.
- The existance of new release is checked every 4 hours
- On every new release, the workflow downloads the latest iVentoy files, builds the Docker image, and publishes it to GitHub Container Registry.


**Upstream iVentoy Repository:** 
[ventoy/PXE](https://github.com/ventoy/PXE)


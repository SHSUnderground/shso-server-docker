# shso-server-docker
A repo to easily create a private server to play SHSO using Docker and Docker Compose.
# Usage
## Important Note
Remember to download the public game build or build your private instance, then change the IP in the game's folder in `shso_Data/AssetBundles/Configuration/servers.xml` to `127.0.0.1`, don't change the ports.
## Installation
### Easy way:
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop/) and restart.
- Download the repo (Code button -> Download ZIP) or from [here](https://github.com/SHSUnderground/shso-server-docker/archive/refs/heads/master.zip).
- Extract it somewhere.
- Double click on `start.bat` whenever you want to start it, to close simply close the window.
### Proper way:
Clone the repo, change into the newly created directory, and then set up via Docker Compose:
```
git clone --recurse-submodules https://github.com/SHSUnderground/shso-server-docker
cd shso-server-docker
docker compose up
```
## Shutdown
```
docker compose down
```
# Starting it again
Open a terminal in the same directory `shso-server-docker` then run:
```
docker compose up
```
# Game
- Log in with username: `User` and password: `password`.
- Don't forget to edit the IP and set it to `127.0.0.1` in the game directory's `AssetBundles\Configuration\server.xml`.

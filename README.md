# shso-server-docker
A repo to easily create a private server to play SHSO using Docker and Docker Compose.
# Usage
## Installation
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
- Don't forget to edit the IP in the game directory's `AssetBundles\Configuration\server.xml`

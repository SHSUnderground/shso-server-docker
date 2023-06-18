# shso-server-docker
A repo to easily create a private server to play SHSO using Docker and Docker Compose.
# Contact
## Support
For any help with any in-game issues go to the official server below:  
<a href="https://discord.gg/cVSYeVa2Gg"><img src="https://discordapp.com/api/guilds/735244842921099427/widget.png?style=banner3" alt="Support Server"></a>
## Dev Discussion
Go to `#development-only` in the community server below:  
<a href="https://discord.gg/PH54Utcm5Y"><img src="https://discordapp.com/api/guilds/895805639979331635/widget.png?style=banner3" alt="Community Server"></a>
# Installation
## Easy way:
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop/) and restart.
- Download the repo (Code button -> Download ZIP) or from [here](https://github.com/SHSUnderground/shso-server-docker/archive/refs/heads/master.zip).
- Extract it into a folder somewhere easily accessible.
- Double click on `start.bat` whenever you want to start it, to close simply close the window.
## Proper way:
### Setup
Clone the repo, change into the newly created directory, and then set up via Docker Compose:
```
git clone --recurse-submodules https://github.com/SHSUnderground/shso-server-docker
cd shso-server-docker
docker compose up
```
### Complete shutdown and remove the container
```
docker compose down
```
### Starting it again
Open a terminal in the same directory `shso-server-docker` then run:
```
docker compose up
```
# Game
- Remember to download the public game build from the official server (linked above) or build your private build.
- Edit the IP and set it to `127.0.0.1` in the game directory's `AssetBundles\Configuration\server.xml`.
- Log in with username: `User` and password: `password`.

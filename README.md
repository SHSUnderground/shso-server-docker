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
- Download download ZIP from this [SHSUnderground/shso-server](https://github.com/SHSUnderground/shso-server/archive/refs/heads/master.zip).
- Extract `shso-server-master` into `shso-server-docker-master`.
- Rename `shso-server-master` into `shso-server`.
- Double click on `start`/`start.bat` whenever you want to start it, to close simply close the window.
- To be able to delete the server files from Docker, double click on `unload`/`unload.bat` and then:
  -  Open Docker Desktop from the start menu.
  -  Go to the Volumes tab.
  -  Select all (or just anything that starts with `shso` if you already used Docker before, otherwise select all).
  -  Delete everything.
  -  Repeat for the Images tab.
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
- For heroes at level 40, log in with username: `Super_User` and password: `password`.
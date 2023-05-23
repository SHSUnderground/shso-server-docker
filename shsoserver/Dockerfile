# Use the official Ubuntu base image
FROM ubuntu:latest

# Update the package lists in the Ubuntu image
RUN apt-get update

# Optionally, install additional packages
RUN apt-get install -y curl unzip


RUN mkdir /home/shsoserver
WORKDIR /home/shsoserver
RUN curl -L -o SFSPRO_linux64_1.6.6.tar.gz https://www.smartfoxserver.com/download/get/77
RUN tar -xf SFSPRO_linux64_1.6.6.tar.gz
RUN mkdir sf-game
RUN mkdir sf-notification
RUN tar -xf SFSPRO_linux64_1.6.6.tar.gz --strip-components=1 -C /home/shsoserver/sf-game
RUN tar -xf SFSPRO_linux64_1.6.6.tar.gz --strip-components=1 -C /home/shsoserver/sf-notification
# COPY ../shso-server/sf-game /home/shsoserver/sf-game
# COPY ../shso-server/sf-notification /home/shsoserver/sf-notification
RUN curl -L -o shso-server.zip https://github.com/SHSUnderground/shso-server/archive/refs/heads/master.zip
RUN unzip -o shso-server.zip 'shso-server-master/sf-game/*' -d '/home/shsoserver/sf-game'
RUN unzip -o shso-server.zip 'shso-server-master/sf-notification/*' -d '/home/shsoserver/sf-notification'
RUN sed -i 's,<UserName><!--DB Username here--></UserName>,<UserName>root</UserName>,g' /home/shsoserver/sf-game/Server/config.xml
RUN sed -i 's,<Password><!--DB Password here--></Password>,<Password>root</Password>,g' /home/shsoserver/sf-game/Server/config.xml
RUN sed -i 's,<UserName><!--DB Username here--></UserName>,<UserName>root</UserName>,g' /home/shsoserver/sf-notification/Server/config.xml
RUN sed -i 's,<Password><!--DB Password here--></Password>,<Password>root</Password>,g' /home/shsoserver/sf-notification/Server/config.xml
WORKDIR /home/shsoserver/sf-game/Server/webserver/webapps/root/rasp/users
RUN find . -type f -name "*.py" -print0 | xargs -0 sed -i "s,sys.path.append('sf-game/Server/webserver/webapps/root/pylibcsp'),sys.path.append('/home/shsoserver/sf-game/Server/webserver/webapps/root/pylibcsp'),g"
WORKDIR /home/shsoserver/sf-game/Server/webserver/webapps/root/rasp/data/json
RUN find . -type f -name "*.py" -print0 | xargs -0 sed -i "s,sys.path.append('sf-game/Server/webserver/webapps/root/pylibcsp'),sys.path.append('/home/shsoserver/sf-game/Server/webserver/webapps/root/pylibcsp'),g"
WORKDIR /home/shsoserver
RUN chmod +x /home/shsoserver/sf-notification/Server/start.sh
RUN chmod +x /home/shsoserver/sf-game/Server/start.sh

# Set the default command to execute when the container starts
CMD ["/home/shsoserver/sf-notification/Server/start.sh;/home/shsoserver/sf-game/Server/start.sh"]
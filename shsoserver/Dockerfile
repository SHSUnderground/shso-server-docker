# Use the official Ubuntu base image
FROM ubuntu:latest

# Update the package lists in the Ubuntu image
RUN apt-get update

# Optionally, install additional packages
RUN apt-get install -y curl


RUN mkdir /home/shsoserver
RUN cd /home/shsoserver
RUN curl -L -o SFSPRO_linux64_1.6.6.tar.gz https://www.smartfoxserver.com/download/get/77
RUN tar -xf SFSPRO_linux64_1.6.6.tar.gz
RUN # mkdir sf-game
RUN # mkdir sf-notification
RUN cp -n -r SmartFoxServer_PRO_1.6.6/* /home/shsoserver/sf-game || true
RUN cp -n -r SmartFoxServer_PRO_1.6.6/* /home/shsoserver/sf-notification || true
RUN # cp -r ./shso-server/* .
RUN sed -i 's,<UserName><!--DB Username here--></UserName>,<UserName>root</UserName>,g' sf-game/Server/config.xml
RUN sed -i 's,<Password><!--DB Password here--></Password>,<Password>root</Password>,g' sf-game/Server/config.xml
RUN sed -i 's,<UserName><!--DB Username here--></UserName>,<UserName>root</UserName>,g' sf-notification/Server/config.xml
RUN sed -i 's,<Password><!--DB Password here--></Password>,<Password>root</Password>,g' sf-notification/Server/config.xml
RUN cd /home/shsoserver/sf-game/Server/webserver/webapps/root/rasp/users
RUN find . -type f -name "*.py" -print0 | xargs -0 sed -i "s,sys.path.append('sf-game/Server/webserver/webapps/root/pylibcsp'),sys.path.append('/home/shsoserver/sf-game/Server/webserver/webapps/root/pylibcsp'),g"
RUN cd /home/shsoserver/sf-game/Server/webserver/webapps/root/rasp/data/json
RUN find . -type f -name "*.py" -print0 | xargs -0 sed -i "s,sys.path.append('sf-game/Server/webserver/webapps/root/pylibcsp'),sys.path.append('/home/shsoserver/sf-game/Server/webserver/webapps/root/pylibcsp'),g"
RUN cd /home/shsoserver/
RUN chmox +x startshso.sh

# Set the default command to execute when the container starts
CMD ["sh /home/shsoserver/startshso.sh"]

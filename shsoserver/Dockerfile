# Use the official MySQL image
FROM ubuntu:focal

# Update the package lists in the Ubuntu image
RUN apt-get update

# Optionally, install additional packages
RUN apt install -y curl openjdk-8-jre

# Copy the .sql file to the container
COPY ./shso-server/SHSO_sample_DB.sql /docker-entrypoint-initdb.d/

# Create a volume to persist the server data
RUN mkdir /home/shsoserver
WORKDIR /home/shsoserver
RUN mkdir /home/shsoserver/sf-game
RUN mkdir /home/shsoserver/sf-notification
VOLUME /home/shsoserver/sf-game
VOLUME /home/shsoserver/sf-notification

# Download Smartfox Server Pro zip and extract it.
RUN curl -L -o SFSPRO_linux64_1.6.6.tar.gz https://www.smartfoxserver.com/download/get/77
RUN tar -xf SFSPRO_linux64_1.6.6.tar.gz --strip-components=1 -C /home/shsoserver/sf-game -k || true
RUN tar -xf SFSPRO_linux64_1.6.6.tar.gz --strip-components=1 -C /home/shsoserver/sf-notification -k || true
# Copy local files.
ADD ./shso-server/ /home/shsoserver 
# Replace credentials.
RUN sed -i 's,<UserName><!--DB Username here--></UserName>,<UserName>root</UserName>,g' /home/shsoserver/sf-game/Server/config.xml
RUN sed -i 's,<Password><!--DB Password here--></Password>,<Password>root</Password>,g' /home/shsoserver/sf-game/Server/config.xml
RUN sed -i 's,<ConnectionString>jdbc:mysql://127.0.0.1:3306/shso?useSSL=false</ConnectionString>,<ConnectionString>jdbc:mysql://shsodb:3306/shso?useSSL=false</ConnectionString>,g' /home/shsoserver/sf-game/Server/config.xml
RUN sed -i 's,<UserName><!--DB Username here--></UserName>,<UserName>root</UserName>,g' /home/shsoserver/sf-notification/Server/config.xml
RUN sed -i 's,<Password><!--DB Password here--></Password>,<Password>root</Password>,g' /home/shsoserver/sf-notification/Server/config.xml
RUN sed -i 's,<ConnectionString>jdbc:mysql://127.0.0.1:3306/shso?useSSL=false</ConnectionString>,<ConnectionString>jdbc:mysql://shsodb:3306/shso?useSSL=false</ConnectionString>,g' /home/shsoserver/sf-notification/Server/config.xml
# Replace relative directory with absolute directory.
RUN find /home/shsoserver/sf-game/Server/webserver/webapps/root/rasp/users -type f -name "*.py" -print0 | xargs -0 sed -i "s,sf-game/Server/webserver/webapps/root,/home/shsoserver/sf-game/Server/webserver/webapps/root,g"
RUN find /home/shsoserver/sf-game/Server/webserver/webapps/root/rasp/data/json -type f -name "*.py" -print0 | xargs -0 sed -i "s,sf-game/Server/webserver/webapps/root,/home/shsoserver/sf-game/Server/webserver/webapps/root,g"
# Set scripts to be executable.
RUN chmod +x /home/shsoserver/sf-notification/Server/start.sh
RUN chmod +x /home/shsoserver/sf-game/Server/start.sh

# Create a temporary directory for future volume mounts to copy new files.
RUN mkdir /home/shsoserver/dev

# Add docker-compose-wait tool.
ENV WAIT_VERSION 2.7.2
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait

EXPOSE 9339
EXPOSE 9389
EXPOSE 80
EXPOSE 8080
# CMD ["cp -r /home/shsoserver/dev/sf-game /home/shsoserver; cp -r /home/shsoserver/dev/sf-notification /home/shsoserver; sed -i 's,<UserName><!--DB Username here--></UserName>,<UserName>root</UserName>,g' /home/shsoserver/sf-game/Server/config.xml; sed -i 's,<Password><!--DB Password here--></Password>,<Password>root</Password>,g' /home/shsoserver/sf-game/Server/config.xml; sed -i 's,<UserName><!--DB Username here--></UserName>,<UserName>root</UserName>,g' /home/shsoserver/sf-notification/Server/config.xml; sed -i 's,<Password><!--DB Password here--></Password>,<Password>root</Password>,g' /home/shsoserver/sf-notification/Server/config.xml; cd /home/shsoserver/sf-game/Server/webserver/webapps/root/rasp/users; find . -type f -name "*.py" -print0 | xargs -0 sed -i 's,sf-game/Server/webserver/webapps/root,/home/shsoserver/sf-game/Server/webserver/webapps/root,g'; cd /home/shsoserver/sf-game/Server/webserver/webapps/root/rasp/data/json; find . -type f -name "*.py" -print0 | xargs -0 sed -i 's,sf-game/Server/webserver/webapps/root,/home/shsoserver/sf-game/Server/webserver/webapps/root,g'; cd /home/shsoserver; chmod +x /home/shsoserver/sf-notification/Server/start.sh; chmod +x /home/shsoserver/sf-game/Server/start.sh; cd /home/shsoserver/sf-notification/Server/; ./start.sh & cd /home/shsoserver/sf-game/Server/; ./start.sh;"]
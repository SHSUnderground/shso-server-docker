mkdir /home/shsoserver
cd /home/shsoserver
curl -L -o SFSPRO_linux64_1.6.6.tar.gz https://www.smartfoxserver.com/download/get/77
tar -xf SFSPRO_linux64_1.6.6.tar.gz
# mkdir sf-game
# mkdir sf-notification
cp -n -r SmartFoxServer_PRO_1.6.6/* /home/shsoserver/sf-game || true
cp -n -r SmartFoxServer_PRO_1.6.6/* /home/shsoserver/sf-notification || true
# cp -r ./shso-server/* .
sed -i 's,<UserName><!--DB Username here--></UserName>,<UserName>root</UserName>,g' sf-game/Server/config.xml
sed -i 's,<Password><!--DB Password here--></Password>,<Password>root</Password>,g' sf-game/Server/config.xml
sed -i 's,<UserName><!--DB Username here--></UserName>,<UserName>root</UserName>,g' sf-notification/Server/config.xml
sed -i 's,<Password><!--DB Password here--></Password>,<Password>root</Password>,g' sf-notification/Server/config.xml
cd /home/shsoserver/sf-game/Server/webserver/webapps/root/rasp/users
find . -type f -name "*.py" -print0 | xargs -0 sed -i "s,sys.path.append('sf-game/Server/webserver/webapps/root/pylibcsp'),sys.path.append('/home/shsoserver/sf-game/Server/webserver/webapps/root/pylibcsp'),g"
cd /home/shsoserver/sf-game/Server/webserver/webapps/root/rasp/data/json
find . -type f -name "*.py" -print0 | xargs -0 sed -i "s,sys.path.append('sf-game/Server/webserver/webapps/root/pylibcsp'),sys.path.append('/home/shsoserver/sf-game/Server/webserver/webapps/root/pylibcsp'),g"
cd /home/shsoserver/
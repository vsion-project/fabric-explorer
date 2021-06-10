#
echo "Start Network - Create Channel in Couchdb"
cd test-network/
./test-network/./network.sh up createChannel -c mychannel -s couchdb -i 2.2
cd .. 
echo "Start Explorer"
cd explorer
docker-compose up -d 
cd .. 
echo "Start Portainer"
cd portainer
docker-compose up -d
cd ..




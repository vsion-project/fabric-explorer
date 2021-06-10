cd test-network/
test-network/./network.sh up createChannel -c mychannel -s couchdb -i 2.2
cd .. 
cd explorer
docker-compose up -d 
cd .. 
cd portainer
docker-compose up -d
cd ..




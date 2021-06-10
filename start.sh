#############################
#3##
### start
###
#################################
echo "---------------------------------------------"
echo "| Start Network - Create Channel in Couchdb |"
echo "---------------------------------------------"
cd test-network/
./network.sh up createChannel -c mychannel -s couchdb -i 2.2
cd .. 
echo "---------------------------------------------"
echo "| Start HyperLedger Explorer                |"
echo "---------------------------------------------"

cd explorer
docker-compose up -d 
cd .. 

echo "---------------------------------------------"
echo "| Start  - Portainter                       |"
echo "---------------------------------------------"

cd portainer
docker-compose up -d
cd ..




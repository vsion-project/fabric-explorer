docker exec orderer-cli sh -c 'peer channel fetch config latest_config.block -o orderer.criptovision.com:7050 -c system-channel --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/criptovision.com/orderers/orderer.criptovision.com/msp/tlscacerts/tlsca.criptovision.com-cert.pem'
docker cp orderer-cli:/opt/gopath/src/github.com/hyperledger/fabric/peer/latest_config.block ./channel-artifacts/latest_config.block
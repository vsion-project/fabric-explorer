ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/criptovision.com/orderers/orderer2.criptovision.com/msp/tlscacerts/tlsca.criptovision.com-cert.pem

docker exec -e ORDERER_CA=$ORDERER_CA cli sh -c 'peer chaincode invoke -o orderer2.criptovision.com:7050 --tls --cafile $ORDERER_CA --peerAddresses peer0.org1.criptovision.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.criptovision.com/peers/peer0.org1.criptovision.com/tls/ca.crt --peerAddresses peer0.org2.criptovision.com:9051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.criptovision.com/peers/peer0.org2.criptovision.com/tls/ca.crt -C mychannel -n basic -c '\''{"Args":["CreateAsset","20","red", "1","adi", "10"]}'\'''
sleep 3
docker exec cli sh -c 'peer chaincode query -C mychannel -n basic -c '\''{"Args":["GetAllAssets"]}'\'''

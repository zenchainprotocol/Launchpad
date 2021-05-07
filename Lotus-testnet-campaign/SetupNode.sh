#!/bin/bash
DAEMON_NAME="build-linux-amd64"
mkdir zentemp
cd zentemp
echo ✰ Download daemon
wget https://raw.githubusercontent.com/zenchainprotocol/Launchpad/main/build/v1.1.4/$DAEMON_NAME.zip
unzip $DAEMON_NAME.zip
chmod 777 $DAEMON_NAME/zenchaind
cp -f $DAEMON_NAME/zenchaind ~/zenchaind

echo ╔═════════  ZENCHAIN-Lotus-testnet ═════════╗
echo ║                                           ║
echo ║  Hello, welcome to easy setup node app    ║
echo ╚═══════════════════════════════════════════╝
echo
echo ✰ What your moniker name?
read MONIKER

cd ..
~/zenchaind init $MONIKER --chain-id=lotus-tesnet

echo ✰ Download genesis and add persistent peers
wget https://raw.githubusercontent.com/zenchainprotocol/Launchpad/main/Lotus-testnet-campaign/genesis.json
cp -f ./genesis.json ~/.zenchain/config/genesis.json 
sed -i 's/persistent_peers = ""/persistent_peers = "3a74650c63fd5acca3ad4bf6cb21859ba6abc0ba@149.28.136.177:26656"/g' ~/.zenchain/config/config.toml

echo ✰ Start your node
~/zenchaind start

rm -r zentemp
echo ✰✰✰✰ DONE ✰✰✰✰✰
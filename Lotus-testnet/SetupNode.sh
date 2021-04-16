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
wget https://raw.githubusercontent.com/zenchainprotocol/Launchpad/main/Lotus-testnet/genesis-one.json
cp -f ./genesis-one.json ~/.zenchain/config/genesis.json 
sed -i 's/persistent_peers = ""/persistent_peers = "d087db1d451a9e1b52e5e20848c416e6be8d7f0a@45.63.22.19:26656"/g' ~/.zenchain/config/config.toml

echo ✰ Start your node
~/zenchaind start

rm -r zentemp
echo ✰✰✰✰ DONE ✰✰✰✰✰
#!/bin/bash
echo ✰ Download genesis and add persistent peers
wget  https://raw.githubusercontent.com/zenchainprotocol/Launchpad/main/Lotus-testnet-campaign/genesis.json
cp -f ./genesis.json ~/.zenchain/config/genesis.json 
sed -i 's/persistent_peers = "d087db1d451a9e1b52e5e20848c416e6be8d7f0a@45.63.22.19:26656"/persistent_peers = "3a74650c63fd5acca3ad4bf6cb21859ba6abc0ba@149.28.136.177:26656"/g' ~/.zenchain/config/config.toml

echo ✰ Reset your node
~/zenchaind unsafe-reset-all
echo ✰ Start your node
~/zenchaind start

echo ✰✰✰✰ DONE ✰✰✰✰✰

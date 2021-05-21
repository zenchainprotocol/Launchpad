#!/bin/bash
echo ╔═════════  ZENCHAIN-Lotus-testnet ═════════╗
echo ║                                           ║
echo ║  Hello, welcome to easy setup node app    ║
echo ╚═══════════════════════════════════════════╝
echo

DAEMON_NAME="build-linux-amd64"
cd ~
mkdir zentemp
cd zentemp
echo ✰ Step 1: Download zenchaind and install
wget https://raw.githubusercontent.com/zenchainprotocol/Launchpad/main/build/v1.1.5/$DAEMON_NAME.zip
unzip $DAEMON_NAME.zip
sudo chmod 777 $DAEMON_NAME/zenchaind
sudo cp -f $DAEMON_NAME/zenchaind /usr/local/bin/
echo End step 1: Download zenchaind and install 
echo __________________________________________

echo ✰ Step 2: Setup blank node
echo What your moniker name?
read MONIKER
zenchaind init $MONIKER --chain-id=lotus-tesnet
echo End Step 2: Setup blank nodeSetup node blank successfully
echo __________________________________________

echo ✰ Step 3: Download genesis
wget https://raw.githubusercontent.com/zenchainprotocol/Launchpad/main/Lotus-testnet-campaign-dex/genesis.json
cp -f ./genesis.json ~/.zenchain/config/genesis.json 
echo End Step 3: Gnesis has been downloaded successfully

echo Clear temporary files
cd ~
rm -rdf zentemp
echo Clear temporary files has been success

echo ✰ Step 4: Add persistent_peers to able connect testnet
sed -i 's/persistent_peers = ""/persistent_peers = "78f903fd4bd8c110ffbe05e1e21028827723bb2e@seeds.zenchain.network:26656"/g' ~/.zenchain/config/config.toml
echo End step 4: Add persistent peers successfully
echo ✰✰✰✰ DONE ✰✰✰✰✰

echo ╔═════════  ZENCHAIN-Lotus-testnet ══════╗
echo ║                                        ║
echo ║ ZenChain app has been installed!       ║
echo ║                                        ║
echo ║ You can start zenchain with command    ║
echo ║ zenchaind start                        ║
echo ╚════════════════════════════════════════╝
echo
echo ║ <Hint>
echo ║ Hint! If you want to run in background
echo ║ You can using tmux to run zenchain 
echo ║ Please visit:
echo ║ https://linuxize.com/post/getting-started-with-tmux/


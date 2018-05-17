#!/bin/bash
set -u
set -e

mkdir -p qdata/logs
echo "[*] Starting Constellation nodes"
./constellation-start.sh

echo "[*] Starting Ethereum nodes"
set -v
ARGS="--unlock 0 --password passwords.txt --raft --rpc --rpcaddr 0.0.0.0 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum --emitcheckpoints"
PRIVATE_CONFIG=qdata/c1/tm.ipc nohup geth --datadir qdata/dd1 $ARGS --permissioned --raftport 50401 --rpcport 22000 --port 21000 --rpccorsdomain "http://localhost:3000" 2>>qdata/logs/1.log &
PRIVATE_CONFIG=qdata/c2/tm.ipc nohup geth --datadir qdata/dd2 $ARGS --permissioned --raftport 50402 --rpcport 22001 --port 21001 --rpccorsdomain "http://localhost:3000" 2>>qdata/logs/2.log &
PRIVATE_CONFIG=qdata/c3/tm.ipc nohup geth --datadir qdata/dd3 $ARGS --permissioned --raftport 50403 --rpcport 22002 --port 21002 --rpccorsdomain "http://localhost:3000" 2>>qdata/logs/3.log &
PRIVATE_CONFIG=qdata/c4/tm.ipc nohup geth --datadir qdata/dd4 $ARGS --permissioned --raftport 50404 --rpcport 22003 --port 21003 --rpccorsdomain "http://localhost:3000" 2>>qdata/logs/4.log &
set +v

echo
echo "All nodes configured. See 'qdata/logs' for logs, and run e.g. 'geth attach qdata/dd1/geth.ipc' to attach to the first Geth node."
echo "To test sending a private transaction from Node 1 to Node 7, run './runscript script1.js'"

echo

echo "Running logs"
tail -f qdata/logs/1.log

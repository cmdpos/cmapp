#!/bin/bash


CUR_DIR=`pwd`

COSMOS_TOP=${GOPATH}/src/github.com/cmdpos/cmapp
BIN_NAME=${COSMOS_TOP}/build/darwin/gaiacli

CHAIN_ENV0="--node tcp://localhost:20057 --home "${CUR_DIR}"/cache/node0/gaiacli  --chain-id testchain"
CHAIN_ENV1="--node tcp://localhost:20157 --home "${CUR_DIR}"/cache/node1/gaiacli  --chain-id testchain"


printf "alice\n"
gaiacli query account cosmos1c4c9y0tmdnwn38zhk5pzkj7egljzejve2h7zsr ${CHAIN_ENV0}


printf "\njack\n"
gaiacli query account cosmos1c4c9y0tmdnwn38zhk5pzkj7egljzejve2h7zsr ${CHAIN_ENV1}



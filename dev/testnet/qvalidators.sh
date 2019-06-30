#!/bin/bash

nodeid=1
CUR_DIR=`pwd`

COSMOS_TOP=${GOPATH}/src/github.com/cmdpos/cmapp
BIN_CLI_NAME=gaiacli

#CHAIN_ENV0="--node tcp://localhost:10057 --home "${CUR_DIR}"/cache/node${1}/gaiacli  --chain-id testchain"
CHAIN_HOME="--home ${CUR_DIR}/cache/node${nodeid}/gaiacli"
CHAIN_NODE="--node tcp://localhost:10${nodeid}57"

echo "=============query staking validators================="
${BIN_CLI_NAME} query staking validators ${CHAIN_HOME} --chain-id testchain ${CHAIN_NODE}

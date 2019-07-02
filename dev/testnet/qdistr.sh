#!/bin/bash


CUR_DIR=`pwd`

COSMOS_TOP=${GOPATH}/src/github.com/cmdpos/cmapp
BIN_CLI_NAME=gaiacli
BIN_NAME=gaiad

CHAIN_ENV0="--node tcp://localhost:10057 --home cache/node${1}/gaiacli  --chain-id testchain"
CHAIN_HOME="--home ${CUR_DIR}/cache/node${1}/gaiacli"
CHAIN_NODE="--node tcp://localhost:10057"

printf "node${1}\n"
echo "==================================="

${BIN_CLI_NAME} query account $(${BIN_CLI_NAME} keys show node${1} -a ${CHAIN_HOME}) ${CHAIN_ENV0}

echo "==================================="
${BIN_CLI_NAME} query distr params ${CHAIN_ENV0}
echo "==================================="

${BIN_CLI_NAME} query distr validator-outstanding-rewards ${CHAIN_NODE} --chain-id testchain
echo "==================================="

${BIN_CLI_NAME} query distr commission $(${BIN_CLI_NAME} keys show node${1} --bech val -a ${CHAIN_HOME}) ${CHAIN_ENV0} --chain-id testchain
echo "==================================="

${BIN_CLI_NAME} query distr rewards $(${BIN_CLI_NAME} keys show node${1} -a ${CHAIN_HOME}) ${CHAIN_NODE} --chain-id testchain

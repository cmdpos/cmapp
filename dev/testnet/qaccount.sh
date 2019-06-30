#!/bin/bash


CUR_DIR=`pwd`

COSMOS_TOP=${GOPATH}/src/github.com/cmdpos/cmapp
BIN_CLI_NAME=gaiacli
BIN_NAME=${COSMOS_TOP}/build/gaiad


CHAIN_NODE="--node tcp://localhost:10057"

query_account() {
    for (( i=0; i<${1}; i++)) do
        echo "============================================================="
        echo "node${i} account details:"
        CHAIN_HOME="--home ${CUR_DIR}/cache/node${i}/gaiacli"
        CHAIN_ENV0="--node tcp://localhost:10057 --home "${CUR_DIR}"/cache/node${i}/gaiacli  --chain-id testchain"
        ${BIN_CLI_NAME} query account $(${BIN_CLI_NAME} keys show node${i} -a ${CHAIN_HOME}) ${CHAIN_ENV0}
    done
}

query_account 4

#!/usr/bin/env bash



gaiacli tx staking create-validator --amount 1000000stake \
    --pubkey $(gaiad tendermint show-validator) \
    --chain-id testchain --commission-rate 0.1 \
    --commission-max-rate 0.5 \
    --commission-max-change-rate 0.001 \
    --min-self-delegation 1 --from $1 --moniker $1 -y --node localhost:10057

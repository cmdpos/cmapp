#!/bin/bash


gaiacli tx send $(gaiacli keys show node2 --home cache/node2/gaiacli -a) 1stake \
    --from node3 --node localhost:10057 --chain-id testchain -y --home cache/node3/gaiacli


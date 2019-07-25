#!/bin/bash


gaiacli query account $(gaiacli keys show node3 --home cache/node3/gaiacli -a) --node localhost:10057 --chain-id testchain
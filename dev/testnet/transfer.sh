#!/bin/bash

#   gaiacli config chain-id testchain
#        gaiacli config trust-node true
#        gaiacli config output json
#        gaiacli config indent true
#
#gaiacli tx send  $(gaiacli keys show u0 -a) 1stake --generate-only --from u3 --node localhost:10057> unsignedtx.json <<EOF
#y
#12345678
#EOF


gaiacli tx send $1 10090stake --from u2 --node localhost:10357 -y --home ~/.gaiacli
#!/bin/bash

gaiacli tx send  $(gaiacli keys show alice -a) 1mycoin --generate-only --from jack > unsignedtx.json <<EOF
y
asdfghjkl
EOF

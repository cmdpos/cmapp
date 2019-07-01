#!/bin/bash



for ((index=0; index<4; index++)) do
pkey=$(cat cache/node${index}/gaiacli/key_seed.txt)
gaiacli keys add --recover u${index}  << EOF
$pkey
EOF

gaiacli keys add --recover u${index}  << EOF
y
$pkey
EOF
done


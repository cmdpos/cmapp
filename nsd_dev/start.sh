#!/usr/bin/env bash

/killbyname.sh "nsd start"
nsd start 2>&1 > ~/.nsd/nsd.log&


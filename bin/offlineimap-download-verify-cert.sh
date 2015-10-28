#!/bin/bash

local hostname=$1
local sslcertfile=$2

openssl s_client -CApath /etc/ssl/certs -connect ${1}:imaps -showcerts \
       | perl -ne 'print if /BEGIN/../END/; print STDERR if /return/' > $2

openssl s_client -CAfile $2 -connect ${1}:imaps 2>&1 </dev/null

#!/bin/bash
date +%s | sha256sum | base64 | head -c 8 ; echo
sleep 1
date +%s | sha256sum | base64 | head -c 16 ; echo
sleep 1
date +%s | sha256sum | base64 | head -c 32 ; echo
sleep 1
openssl rand -base64 32

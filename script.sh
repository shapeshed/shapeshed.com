#!/usr/bin/env bash

set -o pipefail

DISRIBUTION_ID=

FILES=$(rsync -n -aczz  -e "ssh" --delete --out-format="%n" ./public/ static1.shapeshed.com:/srv/http/shapeshed.com | tail -n +2 | awk '{print "/"$0}')

echo $FILES
aws cloudfront create-invalidation --distribution-id E35BE21D0LJ315 --paths $FILES



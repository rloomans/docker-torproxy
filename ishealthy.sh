#!/bin/bash

set -eu

curl -sS --socks5-hostname 127.0.0.1:9050 https://check.torproject.org/api/ip | jq .IsTor | fgrep -q -x true

export HTTP_PROXY=http://127.0.0.1:8118/ HTTPS_PROXY=http://127.0.0.1:8118/

curl -sS https://check.torproject.org/api/ip | jq .IsTor | fgrep -q -x true

echo OK

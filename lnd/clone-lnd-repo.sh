#!/bin/sh

# exit script on any error
set -e

cd docker
git clone https://github.com/lightningnetwork/lnd.git
cd ..
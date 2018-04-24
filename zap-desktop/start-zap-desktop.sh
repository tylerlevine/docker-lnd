#!/usr/bin/env bash

# exit from script if error was raised.
set -e

cd /tmp/zap-dektop
exec npm run dev "$@"

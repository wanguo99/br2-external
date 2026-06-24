#!/bin/sh

set -eu

TARGET_DIR="$1"

rm -f "$TARGET_DIR/etc/init.d/S01seedrng"

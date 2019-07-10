#!/bin/bash
set -e

bundle check || bundle install --binstubs="$BUNDLE_BIN"
# Ensure all gems installed. Add binstubs to bin which has been added to PATH in Dockerfile.

# Then exec the container's main process.
exec "$@"

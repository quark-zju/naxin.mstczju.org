#!/bin/bash

# goto RAILS_ROOT
cd $(dirname `readlink -f "$0"`)/..

exec bundle exec thin -C config/thin.yml "$@"


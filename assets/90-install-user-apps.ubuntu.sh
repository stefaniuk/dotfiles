#!/bin/bash

set -e

# Install user apps on Ubuntu
#
# Usage:
#   $ source ./commons.sh
#   $ ./90-install-user-apps.ubuntu.sh
#
# Options:
#   REINSTALL=true  # Attempts to reinstall the packages, default is `false`
#   VERBOSE=true    # Show all the executed commands, default is `false`

# ==============================================================================

function main {

  install
}

function install {

  :
}

# ==============================================================================

is-arg-true "$VERBOSE" && set -x

main $*

exit 0

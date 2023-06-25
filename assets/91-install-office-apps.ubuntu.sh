#!/bin/bash

set -e

# Install office apps on Ubuntu
#
# Usage:
#   $ source ./commons.sh
#   $ ./91-install-office-apps.ubuntu.sh
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

#!/bin/bash

set -e

# Install user apps on macOS
#
# Usage:
#   $ source ./commons.sh
#   $ ./90-install-user-apps.macos.sh
#
# Options:
#   REINSTALL=true  # Attempts to reinstall the packages, default is `false`
#   VERBOSE=true    # Show all the executed commands, default is `false`

# ==============================================================================

function main {

  # Customise brew execution
  export HOMEBREW_NO_AUTO_UPDATE=1
  is-arg-true "$REINSTALL" && export install="reinstall --force" || export install="install"

  install
}

function install {

  # Install user apps
  brew $install --cask \
    displaylink \
    enpass \
    google-drive \
    hiddenbar \
    istat-menus \
    keepingyouawake \
    raindropio \
    rectangle \
    snagit \
    tripmode \
    vlc \
    wifi-explorer \
    ||:
}

# ==============================================================================

is-arg-true "$VERBOSE" > /dev/null 2>&1 && set -x

main $*

exit 0

#!/bin/bash

set -e

# Install custom tools on macOS
#
# Usage:
#   $ source ./commons.sh
#   $ ./99-install-custom-tools.macos.sh
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

  # Install custom apps
  brew $install --cask \
    commander-one \
    dcommander \
    enpass \
    istat-menus \
    nordvpn \
    raindropio \
    snagit \
    tripmode \
    vlc \
    wifi-explorer \
    ||:
}

# ==============================================================================

is-arg-true "$VERBOSE" && set -x

main $*

exit 0

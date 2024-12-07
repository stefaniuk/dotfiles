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
    enpass \
    google-drive \
    istat-menus \
    keepingyouawake \
    raindropio \
    rectangle \
    snagit \
    tripmode \
    vlc \
    wifi-explorer \
    ||:

  # TODO: Add `dozer` to the list above once this issue is fixed https://github.com/Mortennn/Dozer/issues/198
  # INFO: Removed `alt-tab, appcleaner, commander-one, dcommander, nordvpn`
}

# ==============================================================================

is-arg-true "$VERBOSE" && set -x

main $*

exit 0

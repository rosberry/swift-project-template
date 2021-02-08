#!/bin/sh

DIR=`dirname $0`
. $DIR/common.sh

echo "Check requirements"

install_brew_dependencies_if_needed \
    git-flow \
    carthage \
    swiftlint \
    swiftgen \
    mono0926/license-plist/license-plist \
    artemnovichkov/projects/fastfood \
    rosberry/tap/general \
    rosberry/tap/depo

general setup
general -n Main -t rsb_mvp_vm_module
depo --carthage-command-path carthage.sh

if command -v addinator &> /dev/null
then
    addinator ./Carthage/Build/iOS/*.framework
fi

carting update 

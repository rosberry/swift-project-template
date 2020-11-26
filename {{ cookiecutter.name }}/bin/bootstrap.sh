#!/bin/sh

DIR=`dirname $0`
. $DIR/common.sh

echo "Check requirements"

install_brew_dependencies_if_needed git-flow carthage swiftlint swiftgen license-plist artemnovichkov/projects/fastfood

depo --carthage-command-path carthage.sh
addinator ./Carthage/Build/iOS/*.framework ./SPM/Build/iOS/*.framework
carting update Carthage SPM

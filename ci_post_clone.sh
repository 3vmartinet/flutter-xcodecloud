#! /bin/zsh

set -e


cd $CI_PRIMARY_REPOSITORY_PATH  # change working directory to the root of your cloned repo.

git clone https://github.com/flutter/flutter.git --depth 1 -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

flutter precache --ios
flutter pub get
dart pub global activate flutterfire_cli

HOMEBREW_NO_AUTO_UPDATE=1
brew install cocoapods
brew install cmake # e.g : flutter_soloud

# Install CocoaPods dependencies.
cd ios
pod deintegrate
pod install

exit 0


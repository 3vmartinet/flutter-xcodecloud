#! /bin/zsh

# The default execution directory of this script is the ci_scripts directory.
cd $CI_PRIMARY_REPOSITORY_PATH

if [ -f "ios/setup_flutter_xcodecloud.sh" ]; then
    echo "Found pre-xcodebuild script. Executing."
else
    echo "No pre-xcodebuild script. Skipping."
fi

export PATH="$PATH:$HOME/flutter/bin"

flutter build ios


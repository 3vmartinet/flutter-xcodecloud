#! /bin/zsh

# The default execution directory of this script is the ci_scripts directory.
cd $CI_PRIMARY_REPOSITORY_PATH

if [ -f "ios/setup_xcodecloud.sh" ]; then
    echo "Found pre-xcodebuild script. Executing."
    ./setup_xcodecloud.sh
else
    echo "No pre-xcodebuild script. Skipping."
fi

export PATH="$PATH:$HOME/flutter/bin"

flutter build ios


#! /bin/zsh

# Set the -e flag to stop running the script in case a command returns
# a nonzero exit code.
set -e

# The default execution directory of this script is the ci_scripts directory.
cd $CI_PRIMARY_REPOSITORY_PATH

if [ -f "ios/setup_xcodecloud.sh" ]; then
    echo "Found pre-xcodebuild script. Executing."
    ./ios/setup_xcodecloud.sh
else
    echo "No pre-xcodebuild script. Skipping."
fi


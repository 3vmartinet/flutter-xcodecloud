#!/bin/sh

# Fail if any command fails
set -e

# Only run if an archive was actually created
if [ ! -d "$CI_ARCHIVE_PATH" ]; then
  echo "No archive found, skipping dSYM upload."
  exit 0
fi

echo "Extracting dSYMs and uploading to Firebase..."

# 1. Locate the upload-symbols tool within your Pods or Frameworks
# For CocoaPods:
UPLOAD_SYMBOLS_PATH="${CI_PRIMARY_REPOSITORY_PATH}/ios/Pods/FirebaseCrashlytics/upload-symbols"

# 2. Locate your GoogleService-Info.plist
GSP_PATH="${CI_PRIMARY_REPOSITORY_PATH}/ios/Runner/GoogleService-Info.plist"

# 3. Find and upload all dSYMs from the archive
find "$CI_ARCHIVE_PATH/dSYMs" -name "*.dSYM" | xargs -I {} "$UPLOAD_SYMBOLS_PATH" -gsp "$GSP_PATH" -p ios {}

echo "dSYM upload complete."


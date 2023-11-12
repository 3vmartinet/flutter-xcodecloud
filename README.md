# flutter-xcodecloud
Helper project for building Flutter apps on Xcode Cloud.

## Goal
When building the iOS variant of a Flutter app using Xcode Cloud, Xcode Cloud looks for a `ci_post_clone.sh` script in a `ci_scripts` folder.
The full path looks like this: `<flutter-app-root>/ios/ci_scripts/ci_post_clone.sh`.
This project provides this folder structure and script to avoid copy-pasting over projects.

## Setup

### Declaring the submodule to the project
Include this project as a Git submodule:
1. Run `git submodule add https://github.com/3vmartinet/flutter-xcodecloud ios/ci_scripts/` at the root of the project
2. Commit the `.gitmodules` file and the clone repository:
    - `git add .`
    - `git commit -m"Add Flutter Xcode Cloud submodule"`
    - `git push`

### Cloning the project after addition of the submodule
Collaborators cloning the project (which now includes the submodule) shall run the following commands post-clone:
1. `git submodule init`
2. `git submodule update`

### Syncing the submodule
To synchronize the latest state of the submodule within the project, run:
- `git submodule update --recursive --remote`

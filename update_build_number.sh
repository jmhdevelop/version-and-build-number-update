#!/bin/bash

git=$(sh /etc/profile; which git)
# Remove this line if the directory of the proyect is the same
cd ..
# ---
number_of_commits=$("$git" rev-list --count HEAD)
git_release_version=$("$git" describe --tags --always --abbrev=0)

target_plist="$TARGET_BUILD_DIR/$INFOPLIST_PATH"
dsym_plist="$DWARF_DSYM_FOLDER_PATH/$DWARF_DSYM_FILE_NAME/Contents/Info.plist"
CFBundleVersion=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "$target_plist")
CFSVString="$CFBundleVersion.$number_of_commits"

echo "New build number: $(git rev-list --count HEAD)"
echo "New version number: $CFSVString"

for plist in "$target_plist" "$dsym_plist"; do
  if [ -f "$plist" ]; then
    /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $number_of_commits" "$plist"
    /usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $CFSVString" "$plist"
  fi
done

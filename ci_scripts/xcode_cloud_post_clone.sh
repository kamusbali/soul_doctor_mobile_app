#!/bin/sh
echo "Xcode Cloud post-clone script running..."

# Setup Flutter
export PATH="$PATH:/opt/flutter/bin"

flutter pub get

flutter build ios --no-codesign

cd ios
pod install

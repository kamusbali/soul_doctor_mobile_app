#!/bin/sh
echo "Running Xcode Cloud post-clone script..."

# Download Flutter SDK
FLUTTER_VERSION="3.19.0"
curl -o flutter.zip https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_$FLUTTER_VERSION-stable.zip
unzip -q flutter.zip
export PATH="$PATH:$(pwd)/flutter/bin"

# Flutter setup
flutter doctor -v
flutter pub get
flutter build ios --no-codesign

# Install CocoaPods
cd ios
pod install

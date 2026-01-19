//
//  ci_post_clone.sh
//  Runner
//
//  Created by Putu Agus Dharma Kusuma on 19/01/26.
//

#!/bin/sh
set -e

echo "=== Xcode Cloud Flutter Production Build ==="

# ===== Download Flutter SDK =====
FLUTTER_VERSION="3.19.0"
curl -L -o flutter.zip \
https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_${FLUTTER_VERSION}-stable.zip

unzip -q flutter.zip
export PATH="$PATH:$(pwd)/flutter/bin"

flutter --version

# ===== Install Dart packages =====
flutter pub get

# ===== Build iOS Production Flavor =====
flutter build ios \
  --flavor production \
  -t lib/main_production.dart \
  --dart-define=ENV=production \
  --no-codesign

# ===== Install CocoaPods =====
cd ios
pod install --repo-update

echo "=== Build Preparation Done ==="

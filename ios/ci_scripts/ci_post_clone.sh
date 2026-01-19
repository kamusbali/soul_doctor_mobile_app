#!/bin/sh
set -e

cd $CI_PRIMARY_REPOSITORY_PATH

echo "📦 Install Flutter"
git clone https://github.com/flutter/flutter.git --depth 1 -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

flutter precache --ios
flutter pub get

echo "🧩 Install CocoaPods HEAD (Xcode 26 fix)"
HOMEBREW_NO_AUTO_UPDATE=1
brew install cocoapods


pod --version

cd ios
pod install --repo-update
cd ..

echo "📝 Create production.env"
mkdir -p conf
echo "BASE_URL=$BASE_URL" > conf/production.env

echo "🚀 Build Flutter production flavor"
flutter build ios \
  --flavor production \
  -t lib/main_production.dart \
  --dart-define=ENV=production

echo "✅ CI finished"
exit 0

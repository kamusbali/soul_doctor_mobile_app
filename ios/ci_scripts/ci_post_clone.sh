#!/bin/sh
set -e

cd $CI_PRIMARY_REPOSITORY_PATH

echo "📦 Install Flutter"
git clone https://github.com/flutter/flutter.git --depth 1 -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

flutter precache --ios
flutter pub get

echo "🧩 Install CocoaPods (Xcode 26 compatible)"
gem install cocoapods --pre
pod --version

cd ios
pod install --repo-update
cd ..

echo "📝 Create production.env"
mkdir -p conf

cat <<EOF > conf/production.env
BASE_URL=$BASE_URL
EOF

echo "🚀 Build Flutter production flavor"
flutter build ios \
  --flavor production \
  -t lib/main_production.dart \
  --dart-define=ENV=production

echo "✅ CI Post Clone Finished"
exit 0

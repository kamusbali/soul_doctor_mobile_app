//
//  ci_post_clone.sh
//  Runner
//
//  Created by Putu Agus Dharma Kusuma on 19/01/26.
//

#!/bin/sh
set -e

cd $CI_PRIMARY_REPOSITORY_PATH

echo "📦 Installing Flutter..."
git clone https://github.com/flutter/flutter.git --depth 1 -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

flutter precache --ios
flutter pub get

echo "🍫 Installing CocoaPods..."
HOMEBREW_NO_AUTO_UPDATE=1 brew install cocoapods
cd ios && pod install
cd ..

echo "📝 Creating production.env from Xcode Cloud environment variables..."
mkdir -p conf

cat <<EOF > conf/production.env
API_URL=$API_URL
SUPABASE_URL=$SUPABASE_URL
SUPABASE_ANON_KEY=$SUPABASE_ANON_KEY
SENTRY_DSN=$SENTRY_DSN
EOF

echo "✅ production.env created"

echo "🚀 Building Flutter iOS (production flavor, production entrypoint)..."

flutter build ios \
  --flavor production \
  -t lib/main_production.dart \
  --dart-define=ENV=production

echo "✅ Flutter production build finished"

exit 0


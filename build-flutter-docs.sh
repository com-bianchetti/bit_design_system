#!/bin/bash

set -e

echo "Building Flutter Web App for Documentation..."
echo ""

cd example

echo "Getting Flutter dependencies..."
flutter pub get

echo ""
echo "Building Flutter web app..."
flutter build web --release

echo ""
echo "Creating docs static directory..."
cd ..
mkdir -p vit-docs/static/flutter-app

echo ""
echo "Cleaning old build..."
rm -rf vit-docs/static/flutter-app/*

echo ""
echo "Copying Flutter web build to docs..."
cp -r example/build/web/* vit-docs/static/flutter-app/

echo ""
echo "Fixing base href for iframe embedding..."
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' 's|<base href="/">|<base href="/flutter-app/">|g' vit-docs/static/flutter-app/index.html
else
  sed -i 's|<base href="/">|<base href="/flutter-app/">|g' vit-docs/static/flutter-app/index.html
fi

echo ""
echo "Flutter app integrated successfully!"
echo ""
echo "Next steps:"
echo "   1. cd vit-docs"
echo "   2. npm start (or restart if already running)"
echo "   3. Visit http://localhost:3000/docs/components/button to see the preview"
echo ""

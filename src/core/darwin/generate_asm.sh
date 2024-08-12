#!/bin/zsh
cc -c impls.m -o arm64-apple-ios15.s -target arm64-apple-ios15 -S -Os -fomit-frame-pointer -fobjc-arc -fno-objc-exceptions -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk
cc -c impls.m -o x86_64-apple-ios15-sim.s -target x86_64-apple-ios15-simulator -S -Os -fomit-frame-pointer -fobjc-arc -fno-objc-exceptions -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk
cc -c impls.m -o arm64-apple-macos12.s -target arm64-apple-macos12 -S -Os -fomit-frame-pointer -fobjc-arc -fno-objc-exceptions -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
cc -c impls.m -o x86_64-apple-macos12.s -target x86_64-apple-macos12 -S -Os -fomit-frame-pointer -fobjc-arc -fno-objc-exceptions -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
for file in arm64-apple-ios15.s x86_64-apple-ios15-sim.s arm64-apple-macos12.s x86_64-apple-macos12.s
do
  < "$file" sed 's/\x01/\\x01/g' | sed 's/\t/    /g' | sed 's/  *; .*//g' | sed 's/  *## .*//g' | sed 's/\([^ ]\)    /\1 /g' | sed '/^    \.build_version .*/d' | sed '/^; .*/d' | sed '/^## .*/d' >! "$file"
done

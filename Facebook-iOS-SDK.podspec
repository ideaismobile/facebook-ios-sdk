Pod::Spec.new do |spec|
  spec.name         = 'Facebook-iOS-SDK'
  spec.version      = '3.16'
  spec.platform	    = :ios, '5.0'
  spec.license	    = 'Apache License, Version 2.0'
  spec.summary      = 'The iOS SDK provides Facebook Platform support for iOS apps.'
  spec.description  = 'The Facebook SDK for iOS enables you to access the Facebook Platform APIs including the Graph API, FQL, and Dialogs.'
  spec.homepage     = 'https://developers.facebook.com/docs/ios/'
  spec.author       = 'Facebook'
  spec.source       = { :git => 'https://github.com/facebook/facebook-ios-sdk.git', :tag => 'sdk-version-3.15.1' }
  spec.source_files = ["src/**/*.{h,m}", "src/AppLink/*.{h,m}"]

  spec.resources = "src/FBUserSettingsViewResources.bundle"
  spec.header_dir = "FacebookSDK"
  spec.weak_frameworks = [
    "Accounts",
    "Social",
    "Security"
  ],
  spec.frameworks = "CoreLocation"
  spec.prepare_command = "find src -name \\*.png | grep -v @ | grep -v -- - | sed -e 's|\\(.*\\)/\\([a-zA-Z0-9]*\\).png|scripts/image_to_code.py -i \\1/\\2.png -c \\2 -o src|' | sh && find src -name \\*.wav | grep -v @ | grep -v -- - | sed -e 's|\\(.*\\)/\\([a-zA-Z0-9]*\\).wav|scripts/audio_to_code.py -i \\1/\\2.wav -c \\2 -o src|'  | sh"
  spec.dependencies = [ 'Bolts' ]
  spec.requires_arc = true
end

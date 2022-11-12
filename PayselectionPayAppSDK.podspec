Pod::Spec.new do |spec|
    spec.name             = 'PayselectionPayAppSDK'
    spec.summary          = 'Core library that allows you to use internet acquiring from Payselection in your app'
    spec.version          = '1.0.1'
    spec.license          = { :type => 'MIT', :file => 'LICENSE' }
    spec.author           = { 'Payselection' => 'support@payselection.com' }
    spec.homepage         = 'https://payselection.com'
    spec.source           = { :git => 'https://github.com/Payselection/Payselection-PayApp-SDK-iOS.git', :tag => "#{spec.version}" }
    spec.source_files     = 'Sources/PayselectionPayAppSDK/**/*.swift'
    spec.resource_bundles = { 'PayselectionPayAppSDK' => ['Sources/PayselectionPayAppSDK/Resources/*.{txt,json,png,jpeg,jpg,storyboard,xib,xcassets,html}']} 
    spec.platform     = :ios
    spec.ios.deployment_target = "13.0"
    spec.requires_arc     = true
    spec.swift_version    = '5.0'
  end

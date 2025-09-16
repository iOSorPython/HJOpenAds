Pod::Spec.new do |s|
  s.name             = 'HJOpenAds'
  s.version          = '2.4.2'
  s.summary          = 'ads sdk'
  s.swift_versions   = ['5.0']

  s.description      = <<-DESC
TODO: Add long description of the pod here.
  DESC

  s.homepage         = 'https://github.com/iOSorPython/HJOpenAds'
  s.license = { :type => 'MIT' }
  s.author           = { 'hubOK' => '260413992@qq.com' }
  s.source           = { :git => 'https://github.com/iOSorPython/HJOpenAds.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files        = 'HJOpenAds/Classes/**/*.{h,m}'
  s.public_header_files = 'HJOpenAds/Classes/**/*.h'
  s.vendored_libraries  = 'HJOpenAds/Libraries/libHJOpenAds.a'

  # s.resource_bundles = {
  #   'HJOpenAds' => ['HJOpenAds/Assets/*.png']
  # }

  s.frameworks = "Foundation","UIKit","MobileCoreServices","CoreGraphics","Security","SystemConfiguration","CoreTelephony","AdSupport","CoreData","StoreKit","AVFoundation","MediaPlayer","CoreMedia","WebKit","Accelerate","CoreLocation","AVKit","MessageUI","QuickLook","AudioToolBox","JavaScriptCore","CoreMotion","Photos"
  s.libraries  = "z","resolv.9","sqlite3","c++","c++abi"

  # ToBid-iOS Adapters
  s.dependency 'ToBid-iOS/MintegralAdapter',  '4.6.10'
  s.dependency 'ToBid-iOS/GDTAdapter',        '4.6.10'
  s.dependency 'ToBid-iOS/BaiduAdapter',      '4.6.10'
  s.dependency 'ToBid-iOS/KSAdapter',         '4.6.10'
  s.dependency 'ToBid-iOS/TouTiaoAdapter',    '4.6.10'
  s.dependency 'ToBid-iOS/CSJMediationAdapter','4.6.10'

  s.static_framework = true
end
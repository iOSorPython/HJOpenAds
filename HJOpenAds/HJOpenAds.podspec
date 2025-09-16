#
# Be sure to run `pod lib lint HJOpenAd.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HJOpenAds'
  s.version          = '2.4.2'
  s.summary          = 'ads sdk'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/iOSorPython/HJOpenAds'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
 s.license = { :type => 'MIT', :file => 'HJOpenAds/LICENSE' }
  s.author           = { 'hubOK' => 'huijingios@136.com' }
s.source = { :git => 'https://github.com/iOSorPython/HJOpenAds.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

s.source_files        = 'HJOpenAd/Classes/**/*.{h,m}'
s.public_header_files = 'HJOpenAd/Classes/**/*.h'
s.vendored_libraries  = 'HJOpenAd/Libraries/libHJOpenAds.a'


  
  # s.resource_bundles = {
  #   'HJOpenAd' => ['HJOpenAd/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.frameworks = "Foundation","UIKit","MobileCoreServices","CoreGraphics","Security","SystemConfiguration","CoreTelephony","AdSupport","CoreData","StoreKit","AVFoundation","MediaPlayer","CoreMedia","WebKit","Accelerate","CoreLocation","AVKit","MessageUI","QuickLook","AudioToolBox","JavaScriptCore","CoreMotion","Photos"
  s.libraries = "z","resolv.9","sqlite3","c++","c++abi"
# s.dependency 'ToBid-iOS/ToBidSDK','4.6.10'
  s.dependency 'ToBid-iOS/MintegralAdapter','4.6.10'
  s.dependency 'ToBid-iOS/GDTAdapter','4.6.10'
  s.dependency 'ToBid-iOS/BaiduAdapter','4.6.10'
  s.dependency 'ToBid-iOS/KSAdapter','4.6.10'
  s.dependency 'ToBid-iOS/TouTiaoAdapter','4.6.10'
  s.dependency 'ToBid-iOS/CSJMediationAdapter','4.6.10'
  s.static_framework = true
end

#
# Be sure to run `pod lib lint MDLocalMsgManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MDLocalMsgManager"
  s.version          = "0.0.1"
  s.summary          = "对本地消息进行的一个解析管理类."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                       对本地消息进行的一个解析管理类,很方便使用.
                       DESC

  s.homepage         = "https://github.com/SirJunqiuWu/MDLocalMsgManager"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jack" => "1071034992@qq.com" }
  s.source           = { :git => "https://github.com/SirJunqiuWu/MDLocalMsgManager.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'MDLocalMsgManager/*.{h,m}'
  s.resource_bundles = {
    'MDLocalMsgManager' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  # s.dependency 'Addition', '~> 0.0.7'
end

#
# Be sure to run `pod lib lint StylingBoilerPlate.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StylingBoilerPlate'
  s.version          = '0.1.18'
  s.summary          = 'Boiler plate for styling of ios project.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Boiler plate for styling of ios project.It helps to setup colors,labels,fonts, buttons and other controls.Also contains some useful extensions.
                       DESC

  s.homepage         = 'https://github.com/mansoor92/StylingBoilerPlate'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mansoor Ali' => 'mali92390@gmial.com' }
  s.source           = { :git => 'https://github.com/mansoor92/StylingBoilerPlate.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'StylingBoilerPlate/Classes/**/*.{h,m,swift}'
    s.resources =  'StylingBoilerPlate/Classes/**/*.{xib,ttf}'

#s.resource_bundles = {
#       'StylingBoilerPlate' => ['StylingBoilerPlate/Assets/*.{png}']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
   s.dependency 'MRProgress'
end

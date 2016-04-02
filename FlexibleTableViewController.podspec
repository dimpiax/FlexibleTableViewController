#
# Be sure to run `pod lib lint FlexibleTableViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FlexibleTableViewController"
  s.version          = "1.0.0"
  s.summary          = "Generic table view controller with external data processing"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                        Generic table view controller with external data processing of functionality,
                        like determine cell's `reuseIdentifier` related to `indexPath`, 
                        configuration of requested cell for display and cell selection handler
                       DESC

  s.homepage         = "https://github.com/dimpiax/FlexibleTableViewController"
  s.screenshots      = "https://github.com/dimpiax/FlexibleTableViewController/raw/master/thumbnail.png"
  s.license          = 'MIT'
  s.author           = { "Pilipenko Dima" => "dimpiax@gmail.com" }
  s.source           = { :git => "https://github.com/dimpiax/FlexibleTableViewController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dimpiax'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'FlexibleTableViewController' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

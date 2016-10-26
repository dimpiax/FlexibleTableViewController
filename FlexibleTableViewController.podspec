#
# Be sure to run `pod lib lint FlexibleTableViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FlexibleTableViewController"
  s.version          = "2.0.2"
  s.summary          = "Generic table view controller with external data processing"
  
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
end

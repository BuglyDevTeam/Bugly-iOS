Pod::Spec.new do |s|
  s.name         = "Bugly"
  s.version      = "1.4.6"
  s.summary      = "Bugly iOS SDK"
  s.description  = "iOS library for Bugly Crash Report Service"
  s.homepage     = "http://bugly.qq.com/"
  s.license      = { :type => "Copyright", :text => "©2016 Tencent.com"}
  s.author       = { "Tencent" => "bugly@tencent.com" }
  s.source       = { :http => "https://raw.githubusercontent.com/BuglyDevTeam/Bugly-iOS/master/release/Bugly-1.4.6.zip" }
  s.requires_arc = false  
  s.platform     = :ios
  s.ios.deployment_target = '7.0'
  s.vendored_frameworks ='Bugly.framework'
  s.source_files = 'Bugly.framework/Headers/*.h'
  s.frameworks = 'SystemConfiguration','Security','JavaScriptCore'
  s.library = 'c++','z'
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2016 tencent.com. All rights reserved.
      LICENSE
  }
  end

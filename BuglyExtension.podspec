Pod::Spec.new do |s|
  s.name         = "BuglyExtension"
  s.version      = "1.0.7"
  s.summary      = "Bugly iOS Extension SDK"
  s.description  = "iOS Extension library for Bugly Crash Report Service"
  s.homepage     = "http://bugly.qq.com/"
  s.license      = { :type => "Copyright", :text => "©2015 Tencent.com"}
  s.author       = { "Tencent" => "bugly@tencent.com" }
  s.source       = { :http => "https://raw.githubusercontent.com/BuglyDevTeam/Bugly-iOS/master/release/BuglyExtension-1.0.7.zip" }
  s.requires_arc = false  
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.vendored_frameworks ='BuglyExtension.framework'
  s.source_files = 'BuglyExtension.framework/Headers/*.h'
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2015 tencent.com. All rights reserved.
      LICENSE
  }
  end

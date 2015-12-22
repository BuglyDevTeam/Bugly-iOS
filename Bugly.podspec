Pod::Spec.new do |s|
  s.name         = "Bugly"
  s.version      = "1.4.4"
  s.summary      = "Bugly iOS SDK"
  s.description  = "iOS library for Bugly Crash Report Service"
  s.homepage     = "http://bugly.qq.com/"
  s.license      = { :type => "Copyright", :text => "©2015 Tencent.com"}
  s.author       = { "Tencent" => "bugly@tencent.com" }
  s.source       = { :http => "https://raw.githubusercontent.com/BuglyDevTeam/Bugly-iOS/master/release/Bugly-1.4.4.zip" }
  s.requires_arc = false  
  s.platform     = :ios
  s.ios.deployment_target = '7.0'
  s.vendored_frameworks ='Bugly.framework'
  s.source_files = 'Bugly.framework/Headers/*.h'
  s.frameworks = 'SystemConfiguration','Security','JavaScriptCore'
  s.library = 'c++','z'
  s.xcconfig = {
       'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
       'CLANG_CXX_LIBRARY' => 'libc++'
  }
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2015 tencent.com. All rights reserved.
      LICENSE
  }
  end

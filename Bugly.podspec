Pod::Spec.new do |s|
  s.name         = "Bugly"
  s.version      = "1.2.9.11"
  s.summary      = "Bugly iOS SDK"
  s.description  = "iOS library for Bugly Crash Report Service"
  s.homepage     = "http://bugly.qq.com/"
  s.license      = { :type => "Copyright", :text => "©2015 Tencent.com"}
  s.author       = { "Tencent" => "bugly@tencent.com" }
  s.source       = { :git => 'https://github.com/BuglyDevTeam/Bugly-iOS.git', :tag => '1.2.9' }
  s.requires_arc = false  
  s.platform     = :ios
  s.ios.deployment_target = '6.0'
  s.vendored_frameworks ='Bugly_libc++/Bugly.framework'
  s.source_files = 'Bugly.framework/Headers/*.h'
  s.frameworks = 'SystemConfiguration','Security'
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

Pod::Spec.new do |s|
  s.name         = "Bugly"
  s.version      = "1.4.7"
  s.summary      = "Bugly iOS SDK"
  s.description  = "iOS library for Bugly Crash Report Service"
  s.homepage     = "http://bugly.qq.com/"
  s.license      = { :type => "Copyright", :text => "©2016 Tencent.com"}
  s.author       = { "Tencent" => "bugly@tencent.com" }
  s.source       = { :http => "http://softfile.3g.qq.com/myapp/buglysdk/Bugly-1.4.7.zip" }
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

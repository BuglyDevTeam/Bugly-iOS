Pod::Spec.new do |s|
  s.authors      = "Tencent"
  s.name         = "Bugly"
  s.version      = "2.4.0"
  s.summary      = "Bugly iOS SDK"
  s.description  = "iOS library for Bugly Crash Report Service"
  s.homepage     = "http://bugly.qq.com/"
  s.license      = { :type => "Commercial", :text => "©2016 Tencent.com"}
  s.author       = { "Tencent" => "bugly@tencent.com" }
  s.source       = { :http => "http://softfile.3g.qq.com/myapp/buglysdk/Bugly-2.4.0.zip" }
  s.requires_arc = true  
  s.platform     = :ios
  s.ios.deployment_target = '7.0'
  s.vendored_frameworks ='Bugly.framework'
  s.frameworks = 'SystemConfiguration','Security'
  s.library = 'z','c++'
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2016 tencent.com. All rights reserved.
      LICENSE
  }
  end

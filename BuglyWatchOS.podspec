Pod::Spec.new do |s|
  s.name         = "BuglyWatchOS"
  s.version      = "1.0(1)"
  s.summary      = "Bugly watchOS SDK"
  s.description  = "watchOS library for Bugly Crash Report Service"
  s.homepage     = "http://bugly.qq.com/"
  s.license      = { :type => "Copyright", :text => "©2015 Tencent.com"}
  s.author       = { "Tencent" => "bugly@tencent.com" }
  s.source       = { :http => "https://raw.githubusercontent.com/BuglyDevTeam/Bugly-iOS/master/release/BuglyWatchOS-1.0(1).zip" }
  s.requires_arc = true  
  s.platform     = :watchos
  s.watchos.deployment_target = '2.0'
  s.vendored_frameworks ='BuglyWatchOS.framework'
  s.source_files = 'BuglyWatchOS.framework/Headers/*.h'
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2015 tencent.com. All rights reserved.
      LICENSE
  }
  end

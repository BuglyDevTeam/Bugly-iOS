Pod::Spec.new do |s|
  s.name         = "Bugly"
  s.version      = "1.2.5"
  s.summary      = "Bugly iOS SDK"
  s.description  = "Bugly iOS SDK - Crash Reporter"
  s.homepage     = "http://bugly.qq.com/"
  s.license      = { :type => "Copyright", :text => "©2015 Tencent.com"}
  s.author       = { "Bugly" => "bugly@qq.com" }
  s.source       = { :http => "https://raw.githubusercontent.com/szrambo/Bugly/master/release/bugly-1.2.5.zip" }
  s.requires_arc = false  
  s.platform     = :ios, '6.0'

  s.source_files = 'Bugly.framework/Headers/*.h'
  s.vendored_frameworks = 'Bugly.framework'
  s.frameworks = 'SystemConfiguration','libz.dylib','libc++.dylib'
end

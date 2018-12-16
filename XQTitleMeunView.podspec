Pod::Spec.new do |s|
s.name = 'XQTitleMeunView'
s.version = '0.0.1'
s.license = { :type => "MIT", :file => "LICENSE" }
s.summary = '菜单栏'
s.homepage = 'https://github.com/weakGG/XQTitleMeunView'
s.authors = { 'WeakGG' => '917709989@qq.com' }
s.source = { :git => "https://github.com/weakGG/XQTitleMeunView.git", :tag => "0.0.1"}
s.requires_arc = true
s.ios.deployment_target = '7.0'
s.source_files = "XQTitleMeunView/XQTitleMeunView/*.{h,m}", "XQTitleMeunView/Category/*.{h,m}"
s.resource = "XQTitleMeunView/XQTitleMeunView/XQTitleMeunView.bundle"
s.frameworks = 'UIKit'
end

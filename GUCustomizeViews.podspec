Pod::Spec.new do |s|

  s.name         = "GUCustomizeViews"
  s.version      = "0.0.8"
  s.summary      = "A short description of GUCustomizeViews."
  s.homepage     = "https://github.com/mosluce/GUCustomizeViews"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "mosluce" => "mosluce@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/mosluce/GUCustomizeViews.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "Classes/**/*.{h,m,swift}"
  s.public_header_files = "GUCustomizeViews.h"
  s.requires_arc = true
  s.frameworks = "UIKit"
  s.dependency "SnapKit"
  s.dependency "SwiftHEXColors"

end

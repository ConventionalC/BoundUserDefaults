Pod::Spec.new do |s|
  s.name         = "BoundUserDefaults"
  s.version      = "0.2"
  s.summary      = "BoundUserDefaults allows you to get and set user defaults as simple subclass properties."
  s.homepage     = "https://github.com/ConventionalC/BoundUserDefaults"
  s.license      = "MIT"
  s.author       = { "Peter DeWeese" => "peter@dewee.se" }
  s.requires_arc = true
  s.source       = { :git => "https://github.com/ConventionalC/BoundUserDefaults.git", :tag => s.version }
  s.source_files = "BoundUserDefaults/*.{h,m}"
  s.public_header_files = "BoundUserDefaults/*.h"
  s.frameworks   = 'Foundation'

  s.ios.deployment_target = '6.0'
  s.ios.frameworks = 'Foundation', 'QuartzCore'

  s.osx.deployment_target = '10.7'
  s.osx.frameworks = 'Cocoa'
end

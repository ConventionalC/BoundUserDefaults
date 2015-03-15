Pod::Spec.new do |s|
  s.name         = "BoundUserDefaults"
  s.version      = "0.1"
  s.summary      = "BoundUserDefaults allows you to get and set user defaults as simple subclass properties."
  s.homepage     = "https://github.com/ConventionalC/BoundUserDefaults"
  s.license      = "MIT"
  s.author       = { "Peter DeWeese" => "peter@dewee.se" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/ConventionalC/BoundUserDefaults.git", :tag => "0.1" }
  s.source_files = "BoundUserDefaults/*.{h,m}"
  s.public_header_files = "BoundUserDefaults/*.h"
  s.frameworks   = 'Foundation'
end

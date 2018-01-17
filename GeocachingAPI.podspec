Pod::Spec.new do |s|
  s.name         = "GeocachingAPI"
  s.version      = "0.0.1"
  s.summary      = "A Geocaching API for Swift."
  s.homepage     = "https://github.com/patricks/GeocachingAPI"

  s.description  = "Geocaching API for Swift."
  s.license      = "MIT"

  s.author             = { "Patrick" => "patrick@helmsdeep.at" }

  s.ios.deployment_target = "10.0"

  s.source       = { :git => "https://github.com/patricks/GeocachingAPI.git", :tag => "#{s.version}" }

  s.source_files  = "Sources/**/*.{swift}"
end

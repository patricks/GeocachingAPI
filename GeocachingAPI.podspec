Pod::Spec.new do |s|
  s.name         = "GeocachingAPI"
  s.version      = "0.0.3"
  s.summary      = "Geocaching API for Swift."
  s.homepage     = "https://github.com/patricks/GeocachingAPI"
  s.description  = "A Swift framework for the Geocaching API."
  s.license      = "MIT"
  s.author       = { "Patrick" => "patrick@helmsdeep.at" }

  s.ios.deployment_target = "10.0"

  s.source       = { :git => "https://github.com/patricks/GeocachingAPI.git", :tag => "#{s.version}" }
  s.source_files = "Sources/**/*.{swift}"
  s.resource_bundle = { "GeocachingAPI" => ["Resources/*.lproj/*.strings"] }
  s.dependency "AlamofireObjectMapper", "~> 5.0"
  s.dependency "AFDateHelper", "~> 4.2.2"
  s.dependency "OAuthSwift", "~> 1.2.0"
end

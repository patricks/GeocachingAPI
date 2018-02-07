Pod::Spec.new do |spec|
  spec.name = "GeocachingAPI"
  spec.version = "0.1.2"
  spec.summary = "Geocaching API for Swift."
  spec.homepage = "https://github.com/patricks/GeocachingAPI"
  spec.description = "A Swift framework for the Geocaching API."
  spec.license = "MIT"
  spec.author = { "Patrick" => "patrick@helmsdeep.at" }

  spec.swift_version = '4.0'
  spec.ios.deployment_target = "10.0"

  spec.source = { :git => "https://github.com/patricks/GeocachingAPI.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/**/*.{swift}"
  spec.resource_bundle = { "GeocachingAPI" => ["Resources/*.lproj/*.strings"] }
  spec.dependency "AlamofireObjectMapper", "~> 5.0"
  spec.dependency "AFDateHelper", "~> 4.2.2"
  spec.dependency "OAuthSwift", "~> 1.2.0"
end

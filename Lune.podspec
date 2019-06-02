Pod::Spec.new do |s|
    s.name         = "Lune"
    s.version      = "0.0.2"
    s.summary      = "Dynamic Link Wrapper Library for iOS"
    s.homepage     = "https://github.com/yotsu12/Lune"
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author             = { "giiiita" => "yotsu12t@gmail.com" }
    s.social_media_url   = "https://twitter.com/giiiita_7"
    s.platform     = :ios, "11.0"
    s.swift_version    = '5.0'
    s.source       = { :git => "https://github.com/yotsu12/Lune.git", :tag => "#{s.version}" }
    s.source_files = "Sources/**/*.swift"
    s.requires_arc = true
    s.static_framework = true
    s.dependency "Firebase/Analytics"
    s.dependency "Firebase/DynamicLinks"
end

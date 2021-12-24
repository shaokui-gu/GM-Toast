Pod::Spec.new do |s|
  s.name         = "GM+Toast"
  s.version      = "0.0.1"
  s.summary      = "A Toast Extension for GM"
  s.homepage     = "https://github.com/shaokui-gu/GM-Toast"
  s.license      = 'MIT'
  s.author       = { 'gushaokui' => 'gushaoakui@126.com' }
  s.source       = { :git => "https://github.com/shaokui-gu/GM-Toast.git" }
  s.source_files = 'Sources/*.swift'
  s.resource_bundles = {
    'GM+Toast' => ['Assets/Toast.bundle']
  }
  s.swift_versions = ['5.2', '5.3', '5.4']
  s.dependency 'GM', '~> 0.0.8'
  s.dependency 'MBProgressHUD'
  s.requires_arc = true
end

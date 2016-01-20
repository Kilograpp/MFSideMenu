Pod::Spec.new do |s|
  s.name     = 'MFSideMenu'
  s.version  = '0.5.5.1'
  s.license  = 'BSD'
  s.summary  = 'Facebook-like side menu for iOS.'
  s.homepage = 'https://github.com/mikefrederick/MFSideMenu'
  s.author   = { 'Michael Frederick' => 'mike@viamike.com' }
  s.source   = { :git => 'git@git.kilograpp.com:iOS/MFSideMenu.git', :tag => s.version.to_s }
  s.platform = :ios
  s.requires_arc = true
  s.source_files = 'MFSideMenu/*'
  s.frameworks   = 'QuartzCore'
end

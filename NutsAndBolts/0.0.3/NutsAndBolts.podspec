Pod::Spec.new do |s|
  s.name             = "NutsAndBolts"
  s.version          = "0.0.3"
  s.summary          = "Core iOS Framework intended to cover up missing parts of Apple's Foundation and UIKit"
  s.homepage         = "https://github.com/swensonhe/nutsandbolts-iOS"
  s.author           = { "Emel Topaloglu" => "emel@swensonhe.com" }
  s.source           = { :git => "https://github.com/swensonhe/nutsandbolts-iOS.git", :tag => s.version }

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'NutsAndBolts/Extensions/', 'NutsAndBolts/Protocols/', 'NutsAndBolts/Views/'

  s.frameworks = 'UIKit'
  s.module_name = 'NutsAndBolts'
end

Pod::Spec.new do |s|
  s.name             = 'WOWCheckbox'
  s.version          = '1.2.1'
  s.summary          = 'Highly customisable checkbox in Swift.'

  s.description      = <<-DESC
A highly customisable checkbox in Swift. Swift 4.0 compatible.
                       DESC

  s.homepage         = 'https://github.com/zhouhao27/WOWCheckbox'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zhou Hao' => 'zhou.hao.27@gmail.com' }
  s.source           = { :git => 'https://github.com/zhouhao27/WOWCheckbox.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'WOWCheckbox/Classes/**/*'
end


Pod::Spec.new do |s|
  s.name             = "HySwipablePagesViewController"
  s.version          = "0.1.0"
  s.summary          = "A Foundation Library."
  s.license          = { :type => 'MIT', :file => 'LICENSE' }

  s.description      = <<-DESC
                       DESC

  s.homepage         = "https://github.com/HyanCat/HySwipablePagesViewController"
  s.license          = 'MIT'
  s.author           = { "HyanCat" => "hyancat@live.cn" }
  s.source           = { :git => "https://github.com/HyanCat/HySwipablePagesViewController.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'HySwipablePagesViewController/**/*.{h,m}'
  s.public_header_files = 'HySwipablePagesViewController/**/*.h'

end

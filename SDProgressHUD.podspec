Pod::Spec.new do |s|
    s.name         = 'SDProgressHUD'
    s.version      = '1.0.0'
    s.summary      = 'An Top Progress HUD for your iOS app.'
    s.homepage     = 'https://github.com/xushuduo/SDProgressHUD'
    s.license      = 'MIT'
    s.authors      = {'xsdCoder' => 'i@xsd.me'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/xushuduo/SDProgressHUD.git', :tag => s.version}
    s.source_files = 'SDProgressHUD/**/*.{h,m}'
    s.requires_arc = true
end
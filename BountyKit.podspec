Pod::Spec.new do |s|
  s.name         = "BountyKit"
  s.version      = "0.2.1"
  s.summary      = "Cocos2d + UIKit + Storyboard + Containers"
  s.description  = "Cocos2d + UIKit + Storyboard + Containers (long desc)"
  s.homepage     = "https://github.com/denizztret/BountyKit"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { "Denis Tretyakov" => "denizz.tret@gmail.com" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/denizztret/BountyKit.git", :tag => "#{s.version}" }

  s.source_files  = 'BountyKit/BountyKit.h'
  s.public_header_files = 'BountyKit/*.h'

  s.requires_arc = true
  s.dependency 'cocos2d', '~> 2.1'
  s.xcconfig =  { 'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/cocos2d/external/kazmath/include"' }

  s.subspec 'Controllers' do |ss|
    ss.source_files = 'BountyKit/BKCC{Navigation,View}Controller.{h,m}'
  end
  
  s.subspec 'Containers' do |ss|
    ss.source_files = 'BountyKit/BKContainer{Controller,Segue}.{h,m}'
  end
  
  s.subspec 'Scenes' do |ss|
    ss.dependency 'BountyKit/Controllers'
    ss.source_files = 'BountyKit/BKScene.{h,m}', 'BountyKit/BKScene{ViewController,ControllerProtocol}.{h,m}', 'BountyKit/CCNode+UIViewController.{h,m}'
  end
end

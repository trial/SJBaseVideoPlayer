Pod::Spec.new do |s|
  s.name         = 'SJBaseVideoPlayer'
  s.version      = '3.7.7.2'
  s.summary      = 'video player.'
  s.description  = 'https://github.com/trial/SJBaseVideoPlayer/blob/master/README.md'
  s.homepage     = 'https://github.com/trial/SJBaseVideoPlayer'
  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author       = { 'SanJiang' => 'changsanjiang@gmail.com' }
  s.platform     = :ios, '14.0'
  s.source       = { :git => 'https://github.com/trial/SJBaseVideoPlayer.git', :tag => "v#{s.version}" }
  s.frameworks  = "UIKit", "AVFoundation"
  s.requires_arc = true

  s.source_files = 'SJBaseVideoPlayer/*.{h,m}'
  s.default_subspecs = 'Common', 'AVPlayer'
  
  s.subspec 'Common' do |ss|
    ss.source_files = 'SJBaseVideoPlayer/Common/**/*.{h,m}'
    ss.dependency 'SJBaseVideoPlayer/ResourceLoader'
  end
  
  s.subspec 'ResourceLoader' do |ss|
    ss.source_files = 'SJBaseVideoPlayer/ResourceLoader/*.{h,m}'
    ss.resources = 'SJBaseVideoPlayer/ResourceLoader/SJBaseVideoPlayerResources.bundle'
  end
  
  s.subspec 'AVPlayer' do |ss|
      ss.source_files = 'SJBaseVideoPlayer/AVPlayer/**/*.{h,m}'
      ss.dependency 'SJBaseVideoPlayer/Common'
  end
  
  s.subspec 'IJKPlayer' do |ss|
      ss.source_files = 'SJBaseVideoPlayer/IJKPlayer/**/*.{h,m}'
      ss.dependency 'SJBaseVideoPlayer/Common'
      ss.dependency 'IJKMediaPlayerKit'
      ss.libraries = 'z', 'c++'
  end

  s.dependency 'Masonry'
  s.dependency 'SJUIKit/AttributesFactory', '>= 0.0.0.38'
  s.dependency 'SJUIKit/ObserverHelper'
  s.dependency 'SJUIKit/Queues'
  s.dependency 'SJUIKit/SQLite3'
end

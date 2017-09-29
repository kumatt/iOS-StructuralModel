#
#  Be sure to run `pod spec lint WK_PrefixHeader.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#
Pod::Spec.new do |s|
  s.name         = "WK_PrefixHeader"
  s.version      = "0.0.1"
  
  #简短介绍，下面是详细介绍
  s.summary      = "something about prefix header of WKPrefixHeader."
  # s.description  = <<-DESC
  #                  DESC

  s.homepage     = "https://github.com/OComme/MobileProjectStructureDemo"
  s.license      = "MIT"

  s.author             = { "OComme" => "a163913692@icloud.com" }
  s.platform     = :ios, "8.0"
  s.requires_arc = true
  
  # 不指定分支
  s.source       = { :git => "https://github.com/OComme/MobileProjectStructureDemo.git", :tag => "#{s.version}" }
  # 或指定分支
  # s.source       = { :git => "https://github.com/OComme/WK-PrefixHeader.git", branch: 'master', :tag => "#{s.version}" }

  # 相对'podspec'文件位置
  s.source_files = "MobileProjectStructureDemo/**/PrefixHeader/*.h"
  
  # 引用头文件
  s.public_header_files = 'MobileProjectStructureDemo/**/PrefixHeader/DefineHeader.h','MobileProjectStructureDemo/**/PrefixHeader/ImportHeader.h'
  s.prefix_header_contents = '#import <MobileProjectStructureDemo/**/PrefixHeader/DefineHeader.h>','#import <MobileProjectStructureDemo/**/PrefixHeader/ImportHeader.h>'
  
  # 资源文件地址
  # s.resource_bundles = {
  #  'PodTestLibrary' => ['Pod/Assets/*.png']
  # }                                       

  # 所需的framework，多个用逗号隔开
  # s.frameworks = 'SystemConfiguration'                  
  
  # 依赖关系，该项目所依赖的其他库，如果有多个需要填写多个s.dependency
  # s.dependency 'SomeOtherPod'   
end

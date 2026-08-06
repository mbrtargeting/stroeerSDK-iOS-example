# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

#source 'https://cdn.cocoapods.org/'
#source 'https://cdn.confiant-integrations.net/backend-integrations/in-app/releases/ios/podspecs.git'

target 'SimpleAdTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # For Confiant
#  pod 'ConfiantSDK', '6.1.4'
  # pod 'YieldloveAdIntegration', :podspec => 'https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.6.0/YieldloveAdIntegration-Confiant.podspec', subspecs: ['Confiant', 'Consent']
  
  pod 'YieldloveAdIntegration/Consent', '10.6.0'

end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end

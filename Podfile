# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

#source 'https://cdn.cocoapods.org/'
#source 'https://cdn.confiant-integrations.net/backend-integrations/in-app/releases/ios/podspecs.git'

target 'SimpleAdTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # For Confiant
#  pod 'ConfiantSDK', '6.1.3'
  # pod 'YieldloveAdIntegration', :podspec => 'https://slabs-yieldlove-ad-integration.s3.eu-central-1.amazonaws.com/ios/YieldloveAdIntegration-10.2.1.podspec', subspecs: ['Gravite', 'Confiant', 'Consent']
  
  # For Gravite
  pod 'AATKit', '3.12.3'
  pod 'YieldloveAdIntegration/Gravite', '10.2.1'
  pod 'YieldloveAdIntegration/Consent', '10.2.1'

end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end

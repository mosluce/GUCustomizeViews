# Uncomment this line to define a global platform for your project
platform :ios, '8.0'

target 'GUCustomizeViews' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for GUCustomizeViews
  pod 'SnapKit'
  pod 'SwiftHEXColors'
end

target 'GUCustomizeViewsExamples' do
  use_frameworks!

  pod 'SnapKit'
  pod 'SwiftHEXColors'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
    end
  end
end

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

flutter_application_path = 'quizzler_flutter_3'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'Add-to-app-3' do
#  pub 'quizzler_flutter_2', :git => 'https://github.com/tushar2001/quizzler_flutter_2.git', :branch => 'main'
  install_all_flutter_pods(flutter_application_path)
end

post_install do |installer|
  flutter_post_install(installer) if defined?(flutter_post_install)
end

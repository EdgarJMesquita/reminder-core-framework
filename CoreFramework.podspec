#
#  Be sure to run `pod spec lint CoreFramework.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "CoreFramework"
  spec.version      = "1.0.1"
  spec.summary      = "CoreFramework foi desenvolvido para atender ao app Reminder como core de design e de components a serem utilizados pela equipe Reminder."
  spec.ios.deployment_target = "13.0"

  spec.description  = <<-DESC
          CoreFramework foi desenvolvido para atender ao app Reminder como core de design e de components a serem utilizados pela equipe Reminder. Uma descrição melhor.
                   DESC

  spec.homepage     = "https://github.com/EdgarJMesquita/reminder-core-framework.git"


  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "EdgarJMesquita" => "edgaroboe@outlook.com" }

  spec.source       = { :git => "https://github.com/EdgarJMesquita/reminder-core-framework.git", :tag => "#{spec.version}" }

  spec.source_files  = "CoreFramework/Sources/**/*.{swift,hx`}"
  spec.exclude_files = "Classes/Exclude"

end

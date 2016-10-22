
Pod::Spec.new do |s|
  s.name             = "CloudVisionKit"
  s.version          = "0.3.1"
  s.summary          = "A Swift interface for Google's Cloud Vision API."

  s.description      = <<-DESC
                    The Google Cloud Vision API enables developers to use Google Vision technology within their own applications.
                    The Vision API allows easy integration of vision detection features within developer applications, including image labeling, face
                    and landmark detection, optical character recognition (OCR), and tagging of explicit content.

                    This framework provides a Swift interface to the Google Cloud Vision API.
                       DESC

  s.homepage         = "https://github.com/mgcm/CloudVisionKit"
  s.license          = 'MIT'
  s.author           = { "Milton Moura" => "miltonmoura@gmail.com" }
  s.source           = { :git => "https://github.com/mgcm/CloudVisionKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mgcm'

  s.ios.deployment_target = '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'CloudVisionKit' => ['Pod/Assets/*.png']
  }

  s.dependency 'Alamofire', '~> 4.0.1'
  s.dependency 'SwiftyJSON', '~> 3.1.1'
  s.dependency 'Unbox', '~> 2.1'
end

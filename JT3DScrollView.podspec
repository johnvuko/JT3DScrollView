Pod::Spec.new do |s|
  s.name         = "JT3DScrollView"
  s.version      = "2.0.0"
  s.summary      = "ScrollView with custom effects during the scroll."
  s.homepage     = "https://github.com/jonathantribouharet/JT3DScrollView"
  s.license      = { :type => 'MIT' }
  s.author       = { "Jonathan Tribouharet" => "jonathan.tribouharet@gmail.com" }
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/jonathantribouharet/JT3DScrollView.git", :tag => s.version.to_s }
  s.source_files  = 'Source/*.swift'
  s.screenshots   = ["https://raw.githubusercontent.com/jonathantribouharet/JT3DScrollView/master/Screens/example.gif"]
end

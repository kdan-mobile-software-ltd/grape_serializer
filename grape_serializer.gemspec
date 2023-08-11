Gem::Specification.new do |s|
  s.name        = "grape_serializer"
  s.version     = File.read("./VERSION.md")
  s.date        = Time.now.strftime('%F')
  s.summary     = "Serializer for Grape Entity"
  s.description = "A serializer base on grape-entity gem"
  s.authors     = ["JiaRou Lee"]
  s.email       = "laura34963@kdanmobile.com"
  s.files       = Dir["lib/**/*"]
  s.require_path     = ["lib"]
  s.homepage    = "https://github.com/kdan-mobile-software-ltd/grape_serializer"
  s.license     = "MIT"

  if defined?(::Rails::Engine) && Rails::VERSION::MAJOR >= 7
    s.add_runtime_dependency 'grape-entity', '~> 1.0.0'
  else
    s.add_runtime_dependency 'grape-entity', '~> 0.10.2'
  end
end
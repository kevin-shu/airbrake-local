$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "airbrake_local/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "airbrake-local"
  s.version     = AirbrakeLocal::VERSION
  s.authors     = ["Kevin"]
  s.email       = ["kevin78515@gmail.com"]
  s.homepage    = "https://github.com/kevin-shu/airbrake-local"
  s.summary     = "Host your error log in your own server with airbrake."
  s.description = "Host your error log in your own server with airbrake."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  # s.add_dependency "rails", "~> 3.2.16"
  s.add_runtime_dependency "airbrake", '>= 3.0'

  # s.add_development_dependency "sqlite3"
end

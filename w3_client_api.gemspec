$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "w3_client_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "w3_client_api"
  s.version     = W3ClientApi::VERSION
  s.authors     = ["Luiz Picolo"]
  s.email       = ["luizpicolo@gmail.com"]
  s.homepage    = "http://www;github.com.br"
  s.summary     = "Summary of W3ClientApi."
  s.description = "Description of W3ClientApi."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency "net-ssh"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end

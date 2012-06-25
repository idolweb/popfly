$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "popfly/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "popfly"
  s.version     = Popfly::VERSION
  s.authors     = ["Rafi Jacoby"]
  s.email       = ["rafi.jacoby@razorfish.com"]
  s.homepage    = "TODO"
  s.summary     = "popfly helps you check if your app can respond to simple requests."
  s.description = "TODO: Description of Popfly."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end

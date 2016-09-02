$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "feedback/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "feedback"
  s.version     = Feedback::VERSION
  s.authors     = ["Phil, Rachel, Ryan"]
  s.email       = ["development.team@moneyadviceservice.org.uk"]
  s.homepage    = "http://www.moneyadviceservice.org.uk"
  s.summary     = "Allow visitors to submit feedback"
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4", "< 5"
  s.add_dependency "dough-ruby", '~> 5.0'
  s.add_dependency 'delayed_job_active_record'
end

source 'http://gems.dev.mas.local'
source "https://rubygems.org"

gemspec

gem 'mysql2'

group :test do
  gem 'rspec-rails'
  gem 'cucumber-rails', require: false
  gem 'i18n-debug'
  gem 'sqlite3'
end

gem 'mas-build', '~> 2.0' if ENV['MAS_BUILD']

source 'http://gems.dev.mas.local'
source "https://rubygems.org"

gemspec

gem 'mysql2'

group :development, :test do
  gem 'danger', require: false
  gem 'danger-rubocop', require: false
end

group :test do
  gem 'brakeman'
  gem 'cucumber-rails', require: false
  gem 'i18n-debug'
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'tzinfo-data'
end

gem 'mas-build', '~> 2.0' if ENV['MAS_BUILD']

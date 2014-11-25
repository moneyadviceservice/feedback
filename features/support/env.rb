
ENV["RAILS_ROOT"] ||= File.dirname(__FILE__) + "../../../spec/dummy"
require 'mas/development_dependencies/cucumber/env'
require File.expand_path(
  "../../../spec/dummy/config/environment.rb",
  __FILE__)

#!/bin/bash -l

set -e -x

export RAILS_ENV=build

bundle install

bundle exec rake app:gem:build

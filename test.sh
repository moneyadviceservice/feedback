#!/bin/bash -l

set -e

export PATH=./bin:$PATH
export RAILS_ENV=test
export BUNDLE_WITHOUT=development

CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
BUNDLE_JOBS=$((CORES-1))

CI_PIPELINE_COUNTER=${GO_PIPELINE_LABEL-0}
CI_EXECUTOR_NUMBER=${EXECUTOR_NUMBER-0}

bundle exec bundle install --jobs $BUNDLE_JOBS

if [ -n "$GO_PIPELINE_NAME" ]; then
  # set up test DB if running on CI
  mv spec/dummy/config/database{-ci,}.yml
fi

bundle exec rake db:drop db:create db:migrate
bundle exec rspec --format=documentation
bundle exec cucumber

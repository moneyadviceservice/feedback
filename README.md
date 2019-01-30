feedback
========

Allow site visitors to submit feedback on tools

## Installation

Add this line to your application's Gemfile:

```sh
git clone git@github.com:moneyadviceservice/feedback.git
```

Ensure you have bundler installed and execute:

```sh
$ bundle
```

Setup your database for both development and tests:
```sh
$ RAILS_ENV=development bundle exec rake db:setup
$ RAILS_ENV=test bundle exec rake db:setup
```

## Usage

To start the dummy application:

```sh
$ cd spec/dummy
$ rails s
```

## Tests

```sh
bundle exec rake
```
This will run Rspec and Cucumber tests.

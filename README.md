[![Code Climate](https://codeclimate.com/github/codeforsanjose/codeforsanjose/badges/gpa.svg)](https://codeclimate.com/github/codeforsanjose/codeforsanjose)
[![Test Coverage](https://codeclimate.com/github/codeforsanjose/codeforsanjose/badges/coverage.svg)](https://codeclimate.com/github/codeforsanjose/codeforsanjose/coverage)
[![Build Status](https://travis-ci.org/codeforsanjose/codeforsanjose.svg)](https://travis-ci.org/codeforsanjose/codeforsanjose)
[![Stories in Ready](https://badge.waffle.io/codeforsanjose/codeforsanjose.png?label=ready&title=Ready)](http://waffle.io/codeforsanjose/codeforsanjose)
## About

The codeforsanjose web application is a prototype to framework for Code for America brigades to use to manage their brigades. It's currently in alpha state.

## Demo
[Here is the demo site](https://codeforsanjose.herokuapp.com/)

## Local Development

Dependencies:
* Install PostgreSQL

You can either follow their directions on their website [here](http://www.postgresql.org/download/macosx/) or you can use Homebrew (`brew install postgres`). I highly recommend using Homebrew. The output for the `brew install` command should include `plist` lines for starting postgres every time your Mac starts and for starting the database up initially.

You'll then need to create the test user that Rails will use to run its migrations:

`psql create role codemonkey with createdb login;`

Ruby and Rails:
* Install Ruby `2.2.3` using either `rbenv` or `rvm`.
* Install `bundler`
* Execute `bundle install`
* Execute `rake assets:precompile`
* Execute `rake db:migrate`
* Execute `rails s`
* Access the front page at `127.0.0.1:3000`
* Access the admin page at `127.0.0.1:3000/admin`

Bonus round:
* Run tests via `rake test`
* Generate code coverage report with `rake rubocop`

## Meetup Integration

A background job runs every hour that collects upcoming Meetup events for a Meetup group specified by its Meetup URL name in `config/settings.yml`.

Those events are stored in SQLite and are accessed from the `welcome_controller` and then rendered in the `app/views/shared/meetup_events` partial.

The Meetup API key is configured via an environment variable. You can set this in a POSIX compliant shell by running `export MEETUP_API_KEY=<your_key_here>` for local development or `rake figaro heroku:set -e production` if you're deploying to Heroku.

If you would like to pull down the latest set of events for an initial seeding of the database then there is a rake task to accomplish just that: `rake meetup_poll_job:perform_now`. However, because of uniqueness validation it'll only be useful for that initial seeding.

The polling job will run ever sixy minutes. The job schedule timing is configured in the `config/schedule.rb` file. However, the whenever gem requires writing to the systems crontab in order for the schedule to take effect. Setting your crontab for local development is not needed but this needs to be done if the application is deployed.

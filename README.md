# Rails API Base

[![Build Status](https://semaphoreci.com/api/v1/damirnurgaliev/rails-api-base/branches/master/badge.svg)](https://semaphoreci.com/damirnurgaliev/rails-api-base)

Lightweight base or "skeleton" application for Ruby on Rails 5+ projects. Built to minimize the time spent writing boilerplate code and performing repetitive setup tasks.

## API docs
* Existing [API docs](https://github.com/DamirNurgaliev/rails-api-base/blob/master/doc/api/index.md) (includes API auth with JWT token)

## Application Gems

* [Knock](https://github.com/nsarno/knock) for user's auth.
* [Rack-Cors](https://github.com/cyu/rack-cors) support for Cross-Origin Resource Sharing.
* [Fast JSON API](https://github.com/Netflix/fast_jsonapi) for objects serialization.
* [Restful::Jsonapi](https://github.com/Netflix/fast_jsonapi) for objects deserialization.
* [Interactors](https://github.com/collectiveidea/interactor) encapsulates application's business logic
* [Puma](https://github.com/puma/puma) as Rails web server
* [Foreman](https://github.com/ddollar/foreman) to manage Procfile-based application
* [Rubocop](https://github.com/bbatsov/rubocop) and [Rubocop-Rspec](https://github.com/nevir/rubocop-rspec)
  for reporting violations of the Ruby style guide
* [Pry Rails](https://github.com/rweng/pry-rails) for interactively exploring objects
* [Spring](https://github.com/rails/spring) for fast Rails actions via
  pre-loading
* [Factory Girl](https://github.com/thoughtbot/factory_girl) for test data
* [RSpec](https://github.com/rspec/rspec) for unit testing

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/ci` - should be used in the CI or locally. Includes rubocop & specs running.
* `bin/server` - to run server locally

## Deployment

### Heroku

Out of the box Rails Api Base ready to be deployed to [Heroku.com](http://heroku.com).

* [Heroku Postgres](https://www.heroku.com/postgres) add-on will be used for database.

```bash
heroku create --addons=heroku-postgresql --remote staging rails-api-base-example
heroku config:add HOST="rails-base-example.herokuapp.com"
git push staging master
heroku run rake db:schema:load
heroku open
```

## Credits

Rails Api Base is maintained by [Damir Nurgaliev](https://github.com/DamirNurgaliev).

source "https://rubygems.org"

ruby "2.5.1"

gem "pg"
gem "rails", "5.2.4.1"

gem "bcrypt"
gem "fast_jsonapi"
gem "interactor"
gem "knock"
gem "puma"
gem "rack-cors"
gem "restful-jsonapi"

group :development do
  gem "foreman"
end

group :development, :test do
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-rails"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "spring"
  gem "spring-commands-rspec"
end

group :test do
  gem "rspec-rails"
  gem "rspec_api_documentation"
end

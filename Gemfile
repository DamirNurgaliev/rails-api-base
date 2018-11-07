source "https://rubygems.org"

ruby "2.5.1"

gem "pg"
gem "rails", "5.2.1"

gem "active_model_serializers"
gem "bcrypt"
gem "interactor"
gem "knock"
gem "puma"
gem "rack-cors"

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

source "https://rubygems.org"

ruby "2.5.1"

gem "pg"
gem "rails", "5.2.1"

gem "active_model_serializers"
gem "puma"
gem "rack-cors"

group :development do
  gem "foreman"
end

group :development, :test do
  gem "pry-rails"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "spring"
  gem "spring-commands-rspec"
end

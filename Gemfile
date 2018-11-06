source "https://rubygems.org"

ruby "2.3.7"

gem "pg"
gem "rails", "5.2.1"

gem "puma"
gem "rack-cors"

group :development do
  gem "foreman"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
end

group :development, :test do
  gem "pry-rails"
end

group :development do
  gem "spring"
  gem "spring-commands-rspec"
end

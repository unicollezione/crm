# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'aasm', '~> 5.2'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'jsonapi-serializer'
gem 'notion', '~> 1.1', '>= 1.1.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rack-cors'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'ruby-trello', '~> 1.5', '>= 1.5.1'

group :development, :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'json_matchers'
  gem 'json-schema'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

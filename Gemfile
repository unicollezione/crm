# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'aasm', '~> 5.2'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise', '~> 4.2'
gem 'factory_bot'
gem 'faraday'
gem 'faraday_middleware'
gem 'jsonapi-serializer'
gem 'notion', '~> 1.1', '>= 1.1.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'prawn'
gem 'puma', '~> 4.1'
gem 'rack-cors'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'ruby-trello', '~> 1.5', '>= 1.5.1'
gem 'sass-rails', '~> 6.0'
gem 'trestle', '~> 0.9.5'
gem 'trestle-auth', '~> 0.4.3'
gem 'webpacker', '~> 5.4', '>= 5.4.2'

gem 'bootstrap', '~> 5.1.0'
gem 'react-rails', '~> 2.6', '>= 2.6.1'

group :development, :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'json_matchers'
  gem 'json-schema'
  gem 'net-http'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'solargraph', '~> 0.43.0'
  gem 'solargraph-rails', '~> 0.2.1.1'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'pry-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

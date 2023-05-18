# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'aasm', '~> 5.2'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bugsnag', '~> 6.24'
gem 'chunky_png'
gem 'cssbundling-rails', '~> 1.1'
gem 'devise'
gem 'factory_bot'
gem 'faraday'
gem 'faraday_middleware'
gem 'hotwire-rails', '~> 0.1.3'
gem 'importmap-rails', '~> 1.1'
gem 'jsbundling-rails', '~> 1.1'
gem 'jsonapi-serializer'
gem 'launchy'
gem 'matrix', '~> 0.4.2'
gem 'notion', '~> 1.1', '>= 1.1.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'prawn'
gem 'puma', '~> 4.1'
gem 'rack-cors'
gem 'rails', '~> 7.0', '>= 7.0.4.1'
gem 'rails-i18n', '~> 7.0.0'
gem 'redis', '~> 4.0'
gem 'rqrcode', '~> 2.1'
gem 'ruby-trello', '~> 3.0'
gem 'sprockets-rails'
gem 'stimulus-rails', '~> 1.2'
gem 'trestle', '~> 0.9.5'
gem 'trestle-active_storage', '~> 3.0', '>= 3.0.1', git: 'https://github.com/alxekb/trestle-active_storage'
gem 'trestle-auth', '~> 0.4.3'
gem 'trestle-search'
gem 'turbo-rails', '~> 1.3'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker', '~> 6.0.0.rc.5'
gem 'wicked_pdf', '~> 2.1'
gem 'wkhtmltopdf-binary', '~> 0.12.6.5'
gem 'yookassa'

gem 'aws-sdk-s3', require: false
gem 'image_processing', '>= 1.2'
gem 'mini_magick'

gem 'bootstrap', '~> 5.1.0'
gem 'react-rails', '~> 2.6', '>= 2.6.1'

group :development, :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'json_matchers'
  gem 'json-schema'
  gem 'net-http'
  gem 'pry'
  gem 'pry-stack_explorer'
  gem 'rspec-rails'
  gem 'shoulda', '~> 3.6'
  gem 'shoulda-matchers', '~> 3.0', require: false
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'pry-rails'
  gem 'solargraph', '~> 0.43.0'
  gem 'solargraph-rails', '~> 0.2.1.1'
  gem 'spring', '~> 4.1.1'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end

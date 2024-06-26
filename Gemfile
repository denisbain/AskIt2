# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '7.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '1.4.2'
# Use Puma as the app server
gem 'puma', '5.3.2'
# При переходе на Esbuild sprockets нужен, чтобы отдавать assets
gem 'sprockets-rails', '~> 3.4'
gem 'jsbundling-rails', '~> 1.0'
gem 'cssbundling-rails', '~> 1.0'

# Use SCSS for stylesheets
gem 'sass-rails', '6'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'blueprinter'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'activerecord-import'
gem 'bcrypt', '~> 3.1.7'
gem 'caxlsx'
gem 'caxlsx_rails'
gem 'dotenv-rails'
gem 'draper', '~> 4.0'
gem 'lokalise_rails', '~> 2'
gem 'rails-i18n', '~> 7.0.0'
gem 'rubyXL'
gem 'rubyzip', '~> 2'
gem 'valid_email2'
gem 'pundit', '~> 2.3'
gem 'sidekiq', '~> 6'


gem 'pagy', '~> 5'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'faker', '2.18'
  gem 'web-console', '4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '3.5'
  gem 'rack-mini-profiler', '2.3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'bullet'
  gem 'rubocop', '~>1.63', require: false
  gem 'rubocop-performance', '~> 1.21', require: false
  gem 'rubocop-rails', '~> 2.24', require: false
  gem 'spring'
  gem "foreman"
  gem 'letter_opener'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

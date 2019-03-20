# ==============================================================================
# Gemfile
# ==============================================================================
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'


# ------------------------------------------------------------------------------
# Core, DB
# ------------------------------------------------------------------------------
# Rails
gem 'rails', '~> 5.2.2'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1', '>= 1.1.4'
# Use Redis for in-memory database
gem 'redis', '~> 4.0', '>= 4.0.2'
gem 'redis-namespace', '~> 1.6'
# Support for Cross-Origin Resource Sharing (CORS) for Rack compatible web applications
gem 'rack-cors', '~> 1.0', '>= 1.0.2'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.3', '>= 1.3.1', require: false
# Use ridgepole for schema management
gem 'ridgepole', '~> 0.7.4'
# Simple, efficient background processing for Ruby
gem 'sidekiq', '~> 5.2'
# adds support for queueing jobs in a recurring way to sidekiq
gem 'sidekiq-scheduler', '~> 3.0'
# An extension to the sidekiq message processing to track your jobs
gem 'sidekiq-status', '~> 1.1'
# Enable per-request global storage
gem 'request_store', '~> 1.4', '>= 1.4.1'
# Authorization
gem 'pundit', '~> 2.0'
# Secure hash algorithm
gem 'bcrypt', '~> 3.1', '>= 3.1.12'
# A library for bulk inserting data using ActiveRecord
gem 'activerecord-import', '~> 1.0'
# Dynamic nested forms using jQuery
gem 'cocoon', '~> 1.2', '>= 1.2.11'
# Preload using if condition
gem 'activerecord-belongs_to_if', '~> 0.1.1'


# ------------------------------------------------------------------------------
# Front
# ------------------------------------------------------------------------------
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
# Vector icons
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0', '>= 5.0.7'
gem 'semantic-ui-sass', '~> 2.4'
gem 'slim-rails', '~> 3.1', '>= 3.1.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 4.1', '>= 4.1.18'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2'
# JSON API serializer
gem 'fast_jsonapi', '~> 1.4'
# Pagination
gem 'pagy', '~> 1.3', '>= 1.3.2'
gem 'api-pagination', '~> 4.8', '>= 4.8.2'
# Give css class to active navigation
gem 'active_link_to', '~> 1.0', '>= 1.0.5'


# ------------------------------------------------------------------------------
# Utilities
# ------------------------------------------------------------------------------
# Use Pry as rails console
gem 'pry-rails', '~> 0.3.9'
# Manage multi-environment settings
gem 'config', '~> 1.7', '>= 1.7.1'
# Provides a client interface for the Sentry error logger
gem 'sentry-raven', '~> 2.9'
# Make managing seeds better
gem 'seed-fu', '~> 2.3', '>= 2.3.9'
# Easily generater of fake data
gem 'ffaker', '~> 2.10'
# Json Web Token
gem 'json-jwt', '~> 1.10'
gem 'jwt', '~> 2.1'
# Middleware to handle HTTP caching
gem 'faraday', '~> 0.15.4'
gem 'faraday_middleware', '~> 0.13.0'
gem 'faraday-http-cache', '~> 2.0'
gem 'faraday_middleware-aws-sigv4', '~> 0.2.4'
# Use rails-i18n as a set of common locale data
gem 'rails-i18n', '~> 5.1'
# Framework for factories
gem 'factory_bot_rails', '~> 5.0'
# Enumerated attributes with I18n
gem 'enumerize', '~> 2.2', '>= 2.2.2'
# Encrypt yaml
gem 'yaml_vault', '~> 1.1', '>= 1.1.2'
# Make command line utilities
gem 'thor', '~> 0.20.0'
# Generate normal random number
gem 'random_bell', '~> 0.2.0'
# A simple HTTP and REST client
gem 'rest-client', '~> 2.0', '>= 2.0.2'
# Convert japan prefecture code(JIS X 0402 based) into prefecture name
gem 'jp_prefecture', '~> 0.9.0'
# Tame Rails' multi-line logging into a single line per request
gem 'lograge', '~> 0.10.0'
# Client for Firebase Cloud Messaging
gem 'andpush', '~> 0.2.1'
# Twitter API interface
gem 'twitter', '~> 6.2'
gem 'twitter-text', '~> 3.0'
gem 'omniauth', '~> 1.9'
gem 'omniauth-twitter', '~> 1.4'


# ------------------------------------------------------------------------------
# Development and Test Only
# ------------------------------------------------------------------------------
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug', '~> 3.6'
  # Ruby code style checking
  gem 'rubocop', '~> 0.63.1'
  # Testing framework
  gem 'rspec-rails', '~> 3.8'
  # Speed up RSpec using Spring
  gem 'spring-commands-rspec', '~> 1.0', '>= 1.0.4'
  # Simplify test code
  gem 'shoulda-matchers', '~> 3.1'
  # Simplify request test code
  gem 'rspec-request_describer', '~> 0.2.2'
  # Run RSpec parallel
  gem 'parallel_tests', '~> 2.27', '>= 2.27.1'
  # Strategies for cleaning databases
  gem 'database_cleaner', '~> 1.7'
  # Code coverage
  gem 'simplecov', '~> 0.16.1', require: false
  # API documentation tool
  gem 'rswag', '~> 2.0', '>= 2.0.5'
  # Detect N+1 queries
  gem 'bullet', '~> 5.7', '>= 5.7.6'
  # Allows stubbing HTTP requests
  gem 'webmock', '~> 3.5'
end


# ------------------------------------------------------------------------------
# Development Only
# ------------------------------------------------------------------------------
group :development do
  # Enable web console
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Run db:reset without stopping app
  gem 'pgreset', '~> 0.1.1'
end

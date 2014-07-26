source 'https://rubygems.org'
ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.2'
gem 'rake', '10.3.2'
gem 'pg', '~> 0.17.1'
# For authentication
gem 'devise', '~> 3.2.3'
# Authorization
gem 'cancan'
# Track changes to your models' data
gem 'paper_trail', '~> 3.0.3'

# CMS
gem 'rails_admin', '~> 0.6.2'
# Mass-assignment protection
gem 'protected_attributes'

gem "paperclip", "~> 4.1.1"

# Soft-delete
gem 'paranoia', '~> 2.0.2'
gem 'paranoia_uniqueness_validator', '~> 1.0.1'

# HTML Abstraction Markup Language
gem 'haml-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
group :doc do 
  gem 'sdoc', '~> 0.4.0'
end

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
group :development do 
  gem 'pry-rails'
  gem 'spring'
  # For models annotation
  gem 'annotate', ">= 2.6.2"
end

group :test, :development do 
  gem 'byebug'
  gem 'rspec-rails',  '~> 3.0.0'
  gem 'rspec-collection_matchers'
  # To generate sample data
  gem "faker"
  # rspec command for Spring.
  gem "spring-commands-rspec"
end

group :test do 
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'simplecov'
end
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


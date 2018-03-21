source 'https://rubygems.org'
ruby "2.4.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'coffee-script-source', '~> 1.12', '>= 1.12.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# easy styles
gem 'bootstrap', '~> 4.0'
gem 'popper_js', '~> 1.12.9'

# awesome font is awesome
gem 'font-awesome-rails'

# CanCanCan is used for authorization
gem 'pundit'

# Login in is always nice
gem 'devise'
gem 'bcrypt-ruby', '~> 3.0.0', require: 'bcrypt'

# Hamlit, a blazing HAML implementation
gem 'hamlit'

# Check out these suit days
gem 'working_hours'

# Pagination
gem 'will_paginate', '~> 3.1'
gem 'will_paginate-bootstrap'

group :development, :test do
  gem 'sqlite3'
  gem 'annotate'
  gem 'erb2haml'
  gem 'pry-byebug'
  gem 'rubocop'
  gem 'listen', '~> 3.0'
end

group :test do
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'spinach'
  gem 'spinach-rails'
  gem 'capybara'
  gem 'site_prism'
  gem 'rspec'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg'
  gem 'puma'
  gem 'rails_12factor'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
  gem 'spring'

  gem 'capistrano', '~> 3.8'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-rvm'
  gem 'capistrano-passenger'
  gem 'slackistrano'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

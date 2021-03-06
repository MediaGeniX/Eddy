source 'https://rubygems.org'
ruby "2.7.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.5'

# Use SCSS for stylesheets
gem 'sassc-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'mini_racer'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Make Rails boot faster
gem 'bootsnap', require: false

# Javascript engine

# easy styles
gem 'bootstrap', '~> 4.4.1'
gem 'popper_js', '~> 1.14.5'

# awesome font is awesome
gem 'font-awesome-rails'

# CanCanCan is used for authorization
gem 'pundit'

# Login in is always nice
gem 'devise'
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', require: 'bcrypt'

# Hamlit, a blazing HAML implementation
gem 'hamlit'

# Check out these suit days
gem 'working_hours'

# Pagination
gem 'will_paginate', '~> 3.1'
gem 'will_paginate-bootstrap4'

gem 'puma'

# Reports
gem 'csv'

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
  gem 'capybara'
  gem 'minitest-capybara'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg'
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

  gem 'wdm', '>= 0.1.0' if Gem.win_platform?
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

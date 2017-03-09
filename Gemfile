source 'https://rubygems.org'
ruby "2.3.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'coffee-script-source', '1.8.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# easy styles
gem 'bootstrap', '~> 4.0.0.alpha3'

# awesome font is awesome
gem 'font-awesome-rails'

# CanCanCan is used for authorization
gem 'cancancan'

# Login in is always nice
gem 'devise'
gem 'bcrypt-ruby', '~> 3.0.0', require: 'bcrypt'

# Haml!
gem 'haml-rails', '~> 0.9'

# Check out these suit days
gem 'working_hours'

# Tether for Bootstrap 4 popovers and stuff
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end

# Pagination
gem 'will_paginate', '~> 3.1'
gem 'will_paginate-bootstrap'

group :development, :test do
  gem 'sqlite3'
  gem 'annotate'
  gem 'erb2haml'
  gem 'pry-byebug'
  gem 'rubocop'
end

group :test do
  gem 'factory_girl_rails', '~> 4.0'
end

group :production do
  gem 'pg'
  gem 'puma'
  gem 'rails_12factor'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'spring'

  gem 'capistrano', '~> 3.6'
  gem 'capistrano-rails', '~> 1.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

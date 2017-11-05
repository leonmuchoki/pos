source 'https://rubygems.org'


gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

gem 'mysql2', '>= 0.3.18', '< 0.5'

# -----------------------------------------
# Use Puma as the app server
# -----------------------------------------
gem 'puma', '~> 3.0'

# -----------------------------------------
# Layout and Rendering
# -----------------------------------------
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'will_paginate-bootstrap'


# -----------------------------------------
# Javascript Resources
# -----------------------------------------
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jquery-turbolinks'
gem 'execjs'

# -----------------------------------------
# Formating Utilities
# -----------------------------------------
gem 'jbuilder', '~> 2.5'
gem 'uglifier', '>= 1.3.0'
gem 'autoprefixer-rails'
gem "active_model_serializers"


# -----------------------------------------
# Authentication and Permissions
# -----------------------------------------
gem 'devise'
#gem 'pundit'



# -----------------------------------------
# Images
# -----------------------------------------
gem "paperclip", "~> 5.0.0"


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'

  gem 'rspec-rails'
  #deprecated
  #gem 'factory_girl_rails'
  gem "factory_bot_rails"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby '2.0.0'
source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'rails', '4.0.0'
gem 'rails', github: 'rails/rails'


gem 'simple_form'
gem 'newrelic_rpm'
gem 'active_model_serializers'

gem 'omniauth'
gem 'omniauth-twitter'
gem 'twitter'

group :production do 
  gem 'pg'
  gem 'rails_12factor'
end

group :test, :development do 
  gem 'sqlite3'
  gem 'faker'
  gem 'better_errors'
  gem 'binding_of_caller'

  # pry for debug
  gem 'pry-rails'
  gem 'pry-debugger'
end

group :test do 
  gem 'rspec'
  gem 'rspec-rails'
  gem 'capybara'

  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-fsevent'  # guard dependency
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'
gem 'unicorn'

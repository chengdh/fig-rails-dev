#source 'http://rubygems.org'
#source 'https://taobao.ruby.org/'
source 'https://gems.ruby-china.org/'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.1.4'
gem 'rails_12factor'
gem 'rails', '4.2.1'
# Use mysql as the database for Active Record
gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'master' # For 4.x

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
#gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# gem 'ruby-plsql',github: 'rsim/ruby-plsql',branch: 'master'
# bundle exec rake doc:rails generates the API under doc/api.


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
#gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


gem 'will_paginate', '~> 3.1'
gem 'cancancan', '~> 1.13', '>= 1.13.1'
gem 'ransack', '~> 1.7'
gem 'state_machine', '~> 1.2'
gem 'acts_as_tree', '~> 2.4'
gem 'lhm', '~> 2.2'
gem 'bootstrap-sass'
gem 'haml-rails'
gem 'high_voltage'
gem 'mysql2'
# gem 'activerecord-oracle_enhanced-adapter'
# gem 'ruby-oci8', '~> 2.2', '>= 2.2.3'
gem 'simple_form'
gem 'therubyracer', :platform=>:ruby
gem 'formtastic-bootstrap'
gem 'formtastic', '~> 3.0'
gem "paperclip", "~> 4.2"
gem 'bootstrap-datepicker-rails'
gem 'net-ssh','2.9.2'
gem 'devise'
gem 'inherited_resources', '~> 1.6'
gem 'savon', '~> 2.11.0'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_20]
  #gem 'capistrano', '~> 3.0.1'
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rails-console'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano3-unicorn'
  #gem 'capistrano-rvm', '~> 0.1.1'
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'rails_apps_pages'
  gem 'rails_layout'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rubocop'
end

group :production do
  gem 'unicorn'
end


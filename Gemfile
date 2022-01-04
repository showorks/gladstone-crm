source 'https://rubygems.org'
ruby '2.6.9'

gem 'rails', '4.2.1'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '>= 1.3.0'
gem "figaro"
gem 'pg'
gem 'activerecord-import'
gem 'daemons'
gem 'delayed_job_active_record'
#gem 'workless'
gem 'carrierwave_direct'

gem 'honeybadger'
gem 'devise'
gem 'devise_lastseenable'
gem 'cancancan'
gem 'record_with_operator'
gem "zipruby"

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bootstrap-sass'
gem 'simple_form'
gem "country_select"
gem 'show_for'
gem "select2-rails"
gem "kaminari"
gem "font-awesome-rails"
gem 'momentjs-rails'
gem 'datetimepicker-rails', github: 'zpaulovics/datetimepicker-rails', branch: 'master', submodules: true

# Use Unicorn as the app server
gem 'unicorn'
gem 'unicorn-rails'


group :development, :test do
  gem 'byebug'                # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'web-console', '~> 2.0' # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'spring'                # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'pry-rails'             # Pry console
  gem "bullet"                # n+1 detection
  gem 'better_errors'         # Better errors
  gem 'binding_of_caller'     # Required by better_errors
  gem "letter_opener"         # View emails in browser instead of delivering them
  gem 'quiet_assets'          # Quieten asset notifications
end

group :production do
  gem 'rails_12factor'
end
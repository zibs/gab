source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

gem 'delayed_job_active_record'
gem 'delayed_job_web'
gem 'font-awesome-rails'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'activeadmin', github: 'activeadmin'
gem 'friendly_id', '~> 5.1.0'

gem "figaro"
gem 'simple_form'
# You'll need to include the following dependencies of Summernote
gem 'bootstrap-sass'
gem 'bootswatch-rails'
# This is the right gem to use summernote editor in Rails projects.
gem 'summernote-rails'
gem 'codemirror-rails'

# To solve the problems on the turbolinks
gem 'jquery-turbolinks'

# Clipboard
gem 'zeroclipboard-rails'

gem 'kaminari'
gem 'bootstrap-kaminari-views'
gem 'cancancan', '~> 1.10'

group :development, :test do
  gem 'rspec-rails', '~> 3.4.2'
  gem 'factory_girl_rails'
  gem 'guard-rspec', require: false
  gem 'faker'
  # gem 'pry-rails'
end

group :development do
  gem 'hirb'
  gem 'awesome_print'
  gem 'interactive_editor'
  gem 'quiet_assets'
end

group :production do
  gem 'puma'
  gem 'rails_12factor'
end

ruby "2.3.0"

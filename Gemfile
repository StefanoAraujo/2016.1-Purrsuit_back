source 'https://rubygems.org'
ruby "2.2.4"

gem 'rails', '4.2.5'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'

gem 'turbolinks'

gem 'jbuilder', '~> 2.0'

gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'bootstrap-sass', '~> 3.3.6'

gem 'rubyzip'

gem 'active_record-acts_as'


# Integration with ionic
gem 'rack-cors', :require => 'rack/cors'
gem 'active_model_serializers'


group :production do
  gem 'pg'
end


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
  gem 'rspec-collection_matchers'
  gem 'factory_girl_rails'
  gem 'sass-rails', '~> 5.0'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'launchy'
  gem 'selenium-webdriver'

  # Integration with between TravisCI and Codeclimate
  gem 'codeclimate-test-reporter', require: nil
end


group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'bootstrap', '~> 4.3.1'
gem 'coffee-rails', '>= 5.0'
gem 'delayed_job_active_record'
gem 'devise', '>= 4.9.2'
gem 'draper'
gem 'image_processing', '>=1.2'
gem 'jbuilder', '>= 2.11'
gem 'jquery-rails'
gem 'mini_racer', platforms: :ruby
# Use postgresql as the database for Active Record
gem 'pg', '>= 1.0', '< 2.0'
gem 'puma', '>= 6.4'
gem 'rails', '~> 7.1'
gem 'sass-rails', '>= 6.0'
#gem 'sqlite3'
gem 'securerandom'
gem 'turbolinks', '>= 5.2'
gem 'uglifier', '>= 4.2'

gem 'bootsnap', '>= 1.17.0', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'faker'
  gem 'rspec-rails', '>= 6.1'
end

group :development do
  gem 'listen', '>= 3.8.0'
  gem 'rubocop', '>= 1.59.0', require: false
  gem 'rubocop-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '>= 2.1.0'
  gem 'web-console', '>= 4.2.1'
end

group :test do
  gem 'capybara'
  gem 'fuubar'
  gem 'factory_bot_rails'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

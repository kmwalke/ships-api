source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.1'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg'
gem 'puma'
gem 'rails'
gem 'redis'
gem 'sass-rails'
gem 'sidekiq'
gem 'sidekiq-cron'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rubocop'
  gem 'rubocop-daemon', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'spring'
end

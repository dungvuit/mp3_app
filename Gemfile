source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = '#{repo_name}/#{repo_name}' unless repo_name.include?('/')
  'https://github.com/#{repo_name}.git'
end

gem 'rails', '~> 5.0.4'
# gem 'pg'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap-sass', '3.3.7'
gem 'font-awesome-rails'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'jwplayer-rails'
gem 'bcrypt'
gem 'carrierwave-audio'
gem 'ckeditor'
gem 'toastr-rails'
gem 'bxslider-rails'
gem 'bootstrap-datepicker-rails'
gem 'ransack'
gem 'devise'
gem 'will_paginate'
gem 'carrierwave-i18n'
gem 'rubocop'
gem 'faker'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'rails-controller-testing'
  gem 'capybara'
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'shoulda-callback-matchers'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry'
  gem 'bullet'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

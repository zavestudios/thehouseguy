# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_path = repo_name.include?('/') ? repo_name : "#{repo_name}/#{repo_name}"
  "https://github.com/#{repo_path}.git"
end

gem 'addressable', '>= 2.8.0'
gem 'aws-sdk-s3', '>= 1.208.0', require: false
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap'
gem 'bootstrap_form',
    git: 'https://github.com/bootstrap-ruby/bootstrap_form.git',
    branch: 'master'
gem 'dartsass-rails'
gem 'feedjira'
gem 'image_processing', '>= 1.12.2'
gem 'jbuilder', '~> 2.5'
gem 'jmespath', '>= 1.6.1'
gem 'jquery-rails', '>= 4.4.0'
gem 'mini_magick', '>= 4.9.4'
gem 'mutex_m'
gem 'pg'
gem 'pg_search', '~> 2.3'
gem 'propshaft'
gem 'puma', '~> 6.4'
gem 'rails', '~> 8.1.0'
gem 'rets'
gem 'rubyzip', '>= 1.3.0'
gem 'simple_form', '>= 5.0'
gem 'terser'
gem 'turbo-rails'

group :development, :test do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'capybara', '~> 2.13'
  gem 'faker'
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '~> 3.5'
  gem 'web-console', '>= 3.3.0'
end

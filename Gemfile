source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 8.1.0'
gem 'puma', '~> 6.4'
gem 'bootstrap_form',
    git: 'https://github.com/bootstrap-ruby/bootstrap_form.git',
    branch: 'master'
gem 'jquery-rails'
gem 'propshaft'
gem 'pg'
gem 'dartsass-rails'
gem 'terser'
gem 'turbo-rails'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'feedjira'
gem 'bootsnap'
gem 'rets'
gem 'image_processing', '~> 1.2'
gem 'aws-sdk-s3', require: false
gem 'simple_form'
gem 'mini_magick'
gem 'pg_search', '~> 2.3'
gem 'mutex_m'

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'faker'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.5'
end

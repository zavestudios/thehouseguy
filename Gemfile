source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails'
gem 'puma', '~> 3.7'
gem 'bootstrap', '~> 4.1.1'
gem 'bootstrap_form',
    git: 'https://github.com/bootstrap-ruby/bootstrap_form.git',
    branch: 'master'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'jquery-rails'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# gem 'therubyracer', platforms: :ruby
gem 'mini_racer'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'feedjira'
gem 'trix-rails', require: 'trix'
gem 'bootsnap'
gem 'rets'
gem 'image_processing', '~> 1.2'
gem 'aws-sdk-s3', require: false
gem 'simple_form'
gem 'mini_magick'
gem 'pg_search', '~> 1.0', '>= 1.0.5'

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'faker'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

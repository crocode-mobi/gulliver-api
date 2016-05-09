source 'https://rubygems.org'
# Core
gem 'rails', '4.2.6'
gem 'rails-api'
gem 'pg'
# Basic
gem 'jbuilder'
gem 'bcrypt', '~> 3.1.7'
gem 'rack-cors', :require => 'rack/cors'
gem 'kaminari'
# Files
gem "paperclip", git: "git://github.com/thoughtbot/paperclip.git"
gem 'aws-sdk', '>= 2.0.0' # If using paperclip `master` (upcoming v5.0)
# Locations
gem 'carmen-rails', '~> 1.0.0'
# Gamification
gem 'merit'
# Deploytment Gems
gem 'figaro'
gem 'puma'

# Metrics
# gem 'newrelic_rpm'
# Background processing
# gem 'redis'
# gem 'sidekiq'
# Social
# gem "koala", "~> 2.2"
# gem "twitter"
#gem 'httparty'

group :development, :production do
  gem 'faker'
end

# Environment Dependent
group :development do
  gem 'hirb'
  gem 'annotate'
  gem 'byebug'
  gem 'sprint'
  # Deployment
  gem 'capistrano'
  gem 'capistrano3-puma'
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm'
end

group :production do
	gem 'rails_12factor'
end

ruby '2.2.3'

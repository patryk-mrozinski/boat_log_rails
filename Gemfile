source 'https://rubygems.org'

gem 'rails', '~> 7.2.1'
gem 'pg', '~> 1.5'
gem 'puma', '>= 5.0'
gem 'tzinfo-data', platforms: %i[ windows jruby ]
gem 'bootsnap', require: false

# graphql related
gem 'graphql', '~> 2.3'
gem 'graphiql-rails', '~> 1.10'
gem 'sprockets-rails', '~> 3.5'
gem 'devise'
gem 'devise-jwt'
gem 'rack-cors'

group :development, :test do
  gem 'annotate'
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[ mri windows ], require: 'debug/prelude'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'rubocop-rails-omakase', require: false
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner-active_record'
end

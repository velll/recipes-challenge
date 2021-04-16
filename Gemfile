ruby '2.7.1'

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'contentful', '~> 2.16'
gem 'sinatra', '~> 2.1'
gem "dry-container", "~> 0.7.2"

group :test, :development do
  gem 'dotenv', '~> 2.7'
  gem 'pry'
  gem 'rack-test', '~> 1.1'
  gem 'rspec', '~> 3.10'
end

group :development do
  gem 'rubocop'
  gem 'shotgun'
end

group :production do
  gem 'unicorn'
end

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.3"

gem "rails", "~> 6.0.2", ">= 6.0.2.1"
gem "pg"
gem "puma", "~> 4.1"
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem "jbuilder", "~> 2.7"
# gem 'redis', '~> 4.0'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

gem "amazing_print"
gem "ougai", "~> 1.7"
gem "rollbar"
gem "twilio-ruby"
gem "ddtrace", "~> 0.34"
gem "pry-byebug"

group :development, :test do
  gem "awesome_print", require: false
  gem "brakeman"
  gem "bundler-audit"
  gem "rspec-rails", "~> 4.0.0.beta"
  gem "standard"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
end

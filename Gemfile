source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.0"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Аутентификация в rails-приложениях
gem 'devise'

# Нужен для пагинации
gem 'will_paginate'

# The original asset for Rails [https://github.com/rails/jquery-rails]
# Нужен для понимания Jqery
gem 'jquery-rails'

# The original asset for Rails [https://github.com/heartcombo/simple_form]
# Нужен для создания форм
gem 'simple_form'

# Use the Puma web server [https://github.com/puma/puma]
#gem "puma", "~> 5.0"


# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Include database gems for the adapters found in the database
# configuration file
# Проверяет файл конфигурации БД и ставит соответствующий гем + сообщения об ошибках
require 'erb'
require 'yaml'
database_file = File.join(File.dirname(__FILE__), "config/database.yml")
if File.exist?(database_file)
  database_config = YAML::load(ERB.new(IO.read(database_file)).result)
  adapters = database_config.values.map {|c| c['adapter']}.compact.uniq
  if adapters.any?
    adapters.each do |adapter|
      case adapter
      when 'mysql2'
        gem "mysql2",  :platforms => [:mri, :mingw, :x64_mingw]
        gem "activerecord-jdbcmysql-adapter", :platforms => :jruby
      when 'mysql'
        gem "activerecord-jdbcmysql-adapter", :platforms => :jruby
      when /postgresql/
        gem "activerecord-jdbcpostgresql-adapter", :platforms => :jruby
      when /sqlite3/
        gem "sqlite3", :platforms => [:mri, :mingw, :x64_mingw]
        gem "jdbc-sqlite3", :platforms => :jruby
        gem "activerecord-jdbcsqlite3-adapter", :platforms => :jruby
      when /sqlserver/
        gem "tiny_tds", :platforms => [:mri, :mingw, :x64_mingw]
        gem "activerecord-sqlserver-adapter", :platforms => [:mri, :mingw, :x64_mingw]
      else
        warn("Unknown database adapter `#{adapter}` found in config/database.yml, use Gemfile.local to load your own database gems")
      end
    end
  else
    warn("No adapter found in config/database.yml, please configure it first")
  end
else
  warn("Please configure your config/database.yml first")
end


# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  gem "mailcatcher"

  # The original asset for Rails [https://github.com/deivid-rodriguez/byebug]
  # Нужен для дебага во время выполнения программы
  gem "byebug"
end

group :assets do
  # The original asset for Rails [https://github.com/rails/coffee-rails]
  # Нужен для понимания ресурсов rails
  gem 'coffee-rails', '~> 4.1'
  # The original asset for Rails [https://github.com/seyhunak/twitter-bootstrap-rails]
  # Нужен для создания форм и кнопок
  gem  'twitter-bootstrap-rails'
  gem 'sass-rails', '~> 5.0'
  gem 'uglifier-rails'

  # The original asset for Rails [https://github.com/rubyjs/therubyracer]
  # Доступ к JS из ruby
  gem 'therubyracer', platforms: :ruby
end

group :production do
  gem 'passenger'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem "webrick"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
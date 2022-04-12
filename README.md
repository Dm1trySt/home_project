# Версии
rvm '1.29.12'

ruby '3.0.0'

rails '7.0.2.3'

bundler '2.2.3'

# Установка:
Настройка twitter_bootstrap:

bundle exec rails g bootstrap:install static

Настройка simple_form:

bundle exec rails g simple_form:install --bootstrap

Для правильной работы кнопок "Удалить" выполнить :

rails importmap:install 

rails turbo:install stimulus:install
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

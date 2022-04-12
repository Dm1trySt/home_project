class News < ApplicationRecord

  # Выгрузка из БД последних 5 записей
  def self.latest(count = 5)
    News.order('created_at DESC').limit(count)
  end
end
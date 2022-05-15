class News < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 5}

  # Выгрузка из БД последних 5 записей
  def self.latest(count = 3)
    News.order(created_at: :desc).limit(count)
  end

  # Форматирование даты
  def news_datetime_format
    self.created_at.strftime('%Y-%m-%d %H:%M')
  end
end
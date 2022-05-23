class News < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 5}

  # Выгрузка из БД последних 5 записей
  def self.latest(count = 3)
    News.order(created_at: :desc).limit(count).decorate
  end
end

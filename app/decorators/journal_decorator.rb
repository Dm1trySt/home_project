class JournalDecorator < ApplicationDecorator
  delegate_all

  # автоматическая декорация ассоциации
  decorates_association :user
  decorates_association :issue

  # локализация даты создания
  def formatted_created_at
    l created_at, format: :long
  end
end

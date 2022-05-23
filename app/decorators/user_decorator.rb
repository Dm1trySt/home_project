class UserDecorator < ApplicationDecorator
  delegate_all

  # Отображение имени или email
  def name_or_email
    return name if name.present?
    email.split('@')[0]
  end
end

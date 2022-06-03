class IssueDecorator < ApplicationDecorator
  delegate_all
  decorates_association :author
  decorates_association :assigned_to
  decorates_association :project


  # локализация даты создания
  def formatted_created_at
    l created_at, format: :long
  end

  # Отображение имени или email
  def name_or_email_user(user)
    return user.name if user.name.present?
    user.email.split('@')[0]
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end

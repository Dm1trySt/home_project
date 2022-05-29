class IssueDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user
  decorates_association :project


  # локализация даты создания
  def formatted_created_at
    l created_at, format: :long
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

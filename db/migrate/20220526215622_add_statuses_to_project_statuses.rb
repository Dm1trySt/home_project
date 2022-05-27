class AddStatusesToProjectStatuses < ActiveRecord::Migration[7.0]
  def change
    statuses =[
      { name: 'Открыт' },
      { name: 'Закрыт' },
      { name: 'В архиве' }
    ]
    statuses.each do |status|
      ProjectStatus.create status
    end
  end
end

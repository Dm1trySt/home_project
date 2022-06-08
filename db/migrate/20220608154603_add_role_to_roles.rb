class AddRoleToRoles < ActiveRecord::Migration[7.0]
  def change
    roles = [
      {name: 'гость'},
      {name: 'техник'},
      {name: 'инженер'},
      {name: 'старший инженер'},
      {name: 'отдел кадров'},
      {name: 'бухгалтер'},
      {name: 'старший бухгалтер'},
      {name: 'менеджер'},
      {name: 'комерческий директор'},
      {name: 'заместитель директора'},
      {name: 'директор'}
    ]
    roles.each do |role|
      Role.create role
    end
  end
end

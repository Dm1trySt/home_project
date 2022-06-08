class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :users, :role, default: 1, null: false
  end
end

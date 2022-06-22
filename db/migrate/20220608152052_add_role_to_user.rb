class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :role, index: true, default: 1, null: false, foreign_key: true
  end
end

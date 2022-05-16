class AddUsersAdminName < ActiveRecord::Migration[7.0]
  def self.up
    add_column :users, :name, :string, null: false
    add_column :users, :admin, :boolean, default: false, null: false
    add_column :users, :status, :integer, default: 1, null: false

    add_index :users, :admin
    add_index :users, :status
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :admin
    remove_column :users, :status
  end
end

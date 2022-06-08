class AddUsersAdminName < ActiveRecord::Migration[7.0]
  def self.up
    add_column :users, :name, :string, null: false
    add_column :users, :admin, :boolean, default: false, nil:false
    add_column :users, :active, :boolean, default: true, nil:false

    add_index :users, :admin
    add_index :users, :active
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :admin
    remove_column :users, :status
  end
end

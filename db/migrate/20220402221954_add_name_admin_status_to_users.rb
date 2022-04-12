class AddNameAdminStatusToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, limit:255, default: "", null:false
    add_column :users, :surname, :string, limit:255, default: "", null:false
    add_column :users, :admin, :boolean, default: false, null:false
    add_column :users, :status, :integer,limit: 4, default: 1, null: false
  end
end

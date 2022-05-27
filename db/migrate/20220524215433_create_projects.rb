class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.string :homepage
      t.date :launch_date, null: false

      t.timestamps
    end

    add_index :projects, :name
    add_index :projects, :launch_date
  end
end

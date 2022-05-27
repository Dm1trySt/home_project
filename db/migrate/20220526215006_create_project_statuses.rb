class CreateProjectStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :project_statuses do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :project_statuses, :name
  end
end

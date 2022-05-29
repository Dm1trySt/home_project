class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false, limit: 65535
      t.integer :status_id, null: false, default: 1
      t.date     :start_date
      t.datetime :closed_on
      t.timestamps
    end
    add_index :issues, :title
    add_index :issues, :status_id
  end
end

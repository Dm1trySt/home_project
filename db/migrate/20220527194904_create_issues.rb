class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.references :author, index: true, null: false, foreign_key: { to_table: :users }
      t.references :assigned_to, index: true, foreign_key: { to_table: :users }
      t.references :project, index: true, null: false, foreign_key: { to_table: :projects }
      t.string :title, null: false
      t.text :description, null: false, limit: 65535
      t.references :status, index: true, null: false, default: 1, foreign_key: { to_table: :issue_statuses }
      t.date     :start_date
      t.datetime :closed_on
      t.timestamps
    end
    add_index :issues, :title
    add_index :issues, :status_id
  end
end

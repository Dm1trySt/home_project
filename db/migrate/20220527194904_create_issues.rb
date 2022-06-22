class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.string :title, null: false
      t.text :description, null: false, limit: 65535
      t.date     :start_date
      t.datetime :closed_on
      t.timestamps
    end
    add_index :issues, :title
  end
end

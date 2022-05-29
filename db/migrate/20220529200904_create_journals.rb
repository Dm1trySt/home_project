class CreateJournals < ActiveRecord::Migration[7.0]
  def change
    create_table :journals do |t|
      t.text :body
      t.belongs_to :issue, null: false, foreign_key: true

      t.timestamps
    end
  end
end

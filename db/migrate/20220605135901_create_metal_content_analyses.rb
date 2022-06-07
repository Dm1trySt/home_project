class CreateMetalContentAnalyses < ActiveRecord::Migration[7.0]
  def change
    create_table :metal_content_analyses do |t|
      t.text :project_name, null:false
      t.references :project, index: true, null: false, foreign_key: { to_table: :projects }
      t.date :create_date, null: false
      t.text :data, null: false
      t.timestamps
    end
  end
end

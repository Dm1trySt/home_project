class AddNameToMetalContentAnalyses < ActiveRecord::Migration[7.0]
  def change
    add_column :metal_content_analyses, :part_name, :text, null: false
  end
end

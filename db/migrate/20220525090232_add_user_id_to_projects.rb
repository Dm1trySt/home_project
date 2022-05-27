class AddUserIdToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :user, null: false, foreign_key: true
    add_reference :projects, :project_status, null: false, default: 1, foreign_key: true
  end
end

class AddAuthorAssignedProjectToIssues < ActiveRecord::Migration[7.0]
  def change
    add_reference :issues, :author, index: true, null: false, foreign_key: { to_table: :users }
    add_reference :issues, :assigned_to, index: true, foreign_key: { to_table: :users }
    add_reference :issues, :project, index: true, null: false, foreign_key: { to_table: :projects }
    add_reference :issues, :status, index: true, null: false, default: 1, foreign_key: { to_table: :issue_statuses }
  end
end

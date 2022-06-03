class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :author, class_name: 'User'
  belongs_to :assigned_to, class_name: 'User'
  belongs_to :status, class_name: 'IssueStatus'
  has_many :journals, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end

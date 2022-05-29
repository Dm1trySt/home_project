class Issue < ApplicationRecord
  belongs_to :project
  has_many :journals, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end

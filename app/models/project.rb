class Project < ApplicationRecord
  belongs_to :user
  belongs_to :project_status

  validates :name, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 5}

    STATUS_ACTIVE     = 1
    STATUS_CLOSED     = 2
    STATUS_ARCHIVED   = 3

end

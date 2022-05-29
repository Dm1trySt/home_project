class Project < ApplicationRecord
  belongs_to :user
  belongs_to :project_status
  has_many :issues, dependent: :destroy

  validates :name, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 5}

    STATUS_ACTIVE     = 1
    STATUS_CLOSED     = 2
    STATUS_ARCHIVED   = 3


  def self.search(search)
    if search
      Project.find_by(name: search)
    else
      Project.all
    end
  end

end

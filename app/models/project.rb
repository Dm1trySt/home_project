class Project < ApplicationRecord
  belongs_to :user
  belongs_to :project_status
  has_many :issues, dependent: :destroy
  has_many :metal_content_analyses, dependent: :destroy

  validates :name, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 5}

  # Текущий проект
  def self.current_project(id)
    Project.find id
  end

  # Проект активен?
  def is_active?
    self.project_status_id == ProjectStatus::STATUS_ACTIVE_ID
  end

  def self.search(search)
    if search
      Project.find_by(name: search)
    else
      Project.all
    end
  end

end

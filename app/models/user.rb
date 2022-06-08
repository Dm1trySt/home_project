class User < ApplicationRecord

  has_many :news, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :assigned_tos, class_name: 'Issue', dependent: :destroy
  has_many :authors, class_name: 'Issue', dependent: :destroy
  has_many :journals, dependent: :destroy
  belongs_to :role

  enum role: {guest: 1, director: 2, replacement_director: 3, commercial_director: 4, manager: 5, head_accountant: 6,
              accountant: 7, hr: 8, head_engineer: 9, engineer: 10, technician: 11  }, _suffix: :role

  #enum admin: {true: 1, false:0}, _suffix: :admin

  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.active_user
    User.all.where(status: 1)
  end

  # хэш-массив активных пользователей вида [name: имя + email,id: id]
  def self.name_and_email
    users = []
    all_users = User.where(status:1)
    all_users.each do |user|
      users << {name: "#{user.name} (#{user.email})", id: user.id}
    end
  end
end

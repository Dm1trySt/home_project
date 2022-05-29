class User < ApplicationRecord

  has_many :news, dependent: :destroy
  has_many :projects, dependent: :destroy

  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # хэш-массив активных пользователей вида [name: имя + email,id: id]
  def self.name_and_email
    users = []
    all_users = User.where(status:1)
    all_users.each do |user|
      users << {name: "#{user.name} (#{user.email})", id: user.id}
    end
  end
end

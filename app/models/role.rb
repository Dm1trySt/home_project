class Role < ApplicationRecord
  has_many :users, dependent: :destroy

  GUEST_ID                = 1 # гость
  DIRECTOR_ID             = 2 # директор
  REPLACEMENT_DIRECTOR_ID = 3 # заместитель директора
  COMMERCIAL_DIRECTOR_ID  = 4 # коммерческий директор
  MANAGER_ID              = 5 # менеджер
  HEAD_ACCOUNTANT_ID      = 6 # старший бухгалтер
  ACCOUNTANT_ID           = 7 # бухгалтер
  HR_ID                   = 8 # отдел кадров
  HEAD_ENGINEER_ID        = 9 # старший инженер
  ENGINEER_ID             = 10 # инженер
  TECHNICIAN_ID           = 11 # техник
end

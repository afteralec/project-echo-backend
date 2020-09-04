class User < ApplicationRecord
  has_one :contact_list, dependent: :destroy
  has_many :contacts, through: :contact_list
end

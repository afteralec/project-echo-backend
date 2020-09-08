class UserListener < ApplicationRecord
  belongs_to :user
  belongs_to :listener, class_name: 'User'

  has_many :echos
end

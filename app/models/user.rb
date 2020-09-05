class User < ApplicationRecord
  has_many :user_listeners, dependent: :destroy
  has_many :listeners, through: :user_listeners
end

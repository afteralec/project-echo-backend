class Echo < ApplicationRecord
  belongs_to :user
  has_many :echo_listeners, dependent: :destroy
  has_many :listeners, through: :echo_listeners
end

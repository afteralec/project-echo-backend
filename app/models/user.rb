class User < ApplicationRecord
  has_many :user_listeners, dependent: :destroy
  has_many :listeners, through: :user_listeners

  has_many :echos

  has_many :echo_listeners, foreign_key: :listener_id
  has_many :echos_received, through: :echo_listeners, source: :echo
end

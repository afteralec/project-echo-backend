class UserListener < ApplicationRecord
  belongs_to :user
  belongs_to :listener, class_name: 'User'

  validates_uniqueness_of :listener_id, scope: :user_id
end

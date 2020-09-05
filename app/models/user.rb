class User < ApplicationRecord
  has_many :user_listeners, dependent: :destroy
  has_many :listeners, through: :user_listeners

  after_create :set_default_status

  enum status: [ :available, :unavailable ]

  private

  def set_default_status
    self.status = "available"
  end
end

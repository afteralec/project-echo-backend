class User < ApplicationRecord
  has_many :listens, dependent: :destroy
  has_many :listeners, through: :listens

  after_create :set_default_status

  enum status: [ :available, :unavailable ]

  private

  def set_default_status
    self.status = "available"
  end
end

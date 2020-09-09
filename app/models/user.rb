class User < ApplicationRecord
  has_many :user_listeners, dependent: :destroy
  has_many :listeners, through: :user_listeners

  has_many :echos

  has_many :echo_listeners, foreign_key: :listener_id, dependent: :destroy
  has_many :echos_received, through: :echo_listeners, source: :echo

  validates_uniqueness_of :email

  after_validation :set_gravatar_url

  private

  def set_gravatar_url
    self.gravatar_url = "https://www.gravatar.com/avatar/#{self.gravatar_email_hash}?d=robohash"
  end

  def gravatar_email_hash
    Digest::MD5.hexdigest self.email.strip.downcase
  end
end

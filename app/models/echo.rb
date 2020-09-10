class Echo < ApplicationRecord
  attr_reader :user_name

  belongs_to :user
  has_many :echo_listeners, dependent: :destroy
  has_many :listeners, through: :echo_listeners

  # after_initialize :set_user_name

  private

  def user_name=(name)
    @user_name = name
  end

  def set_user_name
    user = self.user
    self.user_name = "#{user.first_name} #{user.last_name}"
  end
end

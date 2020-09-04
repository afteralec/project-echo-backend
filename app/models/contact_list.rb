class ContactList < ApplicationRecord
  belongs_to :user
  has_many :contact_entries, dependent: :destroy
  has_many :contacts, through: :contact_entries
end

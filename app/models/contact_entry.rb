class ContactEntry < ApplicationRecord
  belongs_to :contact_list
  belongs_to :contact, class_name: 'User'
end

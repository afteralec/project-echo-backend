class EchoListener < ApplicationRecord
  belongs_to :echo
  belongs_to :listener, class_name: 'User'
end

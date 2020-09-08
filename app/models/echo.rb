class Echo < ApplicationRecord
    has_many :listeners

    belongs_to :user

end

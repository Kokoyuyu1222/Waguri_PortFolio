class Card < ApplicationRecord
	belongs_to :consumer
    validates :payjp_id, presence: true
end

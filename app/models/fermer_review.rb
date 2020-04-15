class FermerReview < ApplicationRecord
	belongs_to :consumer
	belongs_to :fermer

	validates :comment, presence: true
end

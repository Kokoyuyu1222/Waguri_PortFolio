class ColumnComment < ApplicationRecord
	belongs_to :consumer
	belongs_to :column

	validates :comment, presence: true
end

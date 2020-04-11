class ColumnFavorite < ApplicationRecord
	belongs_to :consumer
	belongs_to :column
end

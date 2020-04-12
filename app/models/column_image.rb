class ColumnImage < ApplicationRecord
	belongs_to :column
	attachment :image
end

class ColumeImage < ApplicationRecord
	belongs_to :column
    attachment :image
end

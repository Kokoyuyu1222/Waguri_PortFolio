class Brand < ApplicationRecord
	belongs_to :category
	has_many :products,dependent: :delete_all
	enum brand_status: { draft: 0, published: 1 }
end

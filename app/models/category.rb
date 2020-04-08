class Category < ApplicationRecord
	has_many :brands,dependent: :destroy
	# has_nany :products,through: :brands
	has_ancestry
	enum category_status: { draft: 0, published: 1 }
end

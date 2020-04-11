class Category < ApplicationRecord
	has_many :brands,dependent: :destroy
	enum category_status: { draft: 0, published: 1 }
end

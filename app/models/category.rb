class Category < ApplicationRecord
	has_many :brands,dependent: :destroy
	enum status: { draft: false, published: true }
end

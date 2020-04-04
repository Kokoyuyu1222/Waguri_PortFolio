class Brand < ApplicationRecord
	belongs_to :category
	has_many :products,dependent: :delete_all
	enum status: { draft: false, published: true }
end

class Product < ApplicationRecord
	belongs_to :brand
	belongs_to :category,through: :brand
	has_many :cart_products
	has_many :order_products
	has_many :orders, through: :order_products

	validates :name, presence: true
    validates :introduction, presence: true
    validates :image, presence: true
    attachment :image
	enum sale_status: { sale: 0, sold_out: 1}
end

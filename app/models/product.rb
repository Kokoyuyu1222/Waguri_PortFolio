class Product < ApplicationRecord
	belongs_to :brand
	belongs_to :fermer
	has_many :cart_products
	has_many :order_products
	has_many :orders, through: :order_products

	validates :name, presence: true
    validates :introduction, presence: true
	enum sale_status: { sale: 0, sold_out: 1}

	has_many :product_images, dependent: :destroy
    accepts_attachments_for :product_images, attachment: :image
end

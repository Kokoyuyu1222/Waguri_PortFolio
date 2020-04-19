class Product < ApplicationRecord
	belongs_to :brand
	belongs_to :fermer
	has_many :product_comments, dependent: :destroy
	has_many :cart_products
	has_many :order_products
	has_many :orders, through: :order_products
	has_one :stock, dependent: :destroy
	accepts_nested_attributes_for :stock,allow_destroy: true

	validates :name, presence: true
    validates :introduction, presence: true
	enum sale_status: { sale: 0, sold_out: 1, littele: 2, same: 3 }

	has_many :product_images, dependent: :destroy
    accepts_attachments_for :product_images, attachment: :image
end

class Product < ApplicationRecord
	belongs_to :brand
	has_many :cart_products
	has_many :order_products
	has_many :orders, through: :order_products

	validates :name, presence: true
    validates :introduction, presence: true
	enum sale_status: { sale: 0, sold_out: 1}

	has_many :column_images, dependent: :destroy
    accepts_nested_attributes_for :column_image
    accepts_attachments_for :column_image, attachment: :image
end

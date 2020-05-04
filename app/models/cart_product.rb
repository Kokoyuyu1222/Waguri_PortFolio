class CartProduct < ApplicationRecord
	belongs_to :consumer
	belongs_to :product

  	validate :validate_stock_quantity_check, on: [:new, :create]

    def validate_stock_quantity_check
    	stock_quantity = product.stock.quantity 
    	if self.quantity > stock_quantity
    		record.errors.add(:quantity, "申し訳ありません。購入できるのは#{stock_quantity}個までです")
    	end
    end
end
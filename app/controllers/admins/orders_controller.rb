class Admins::OrdersController < ApplicationController
	layout 'admin'
	def index
		@order = Order.all
	end
	def show
		@order = Order.find(order_params[:id])
	end
	private
	def order_params
		params.require(:order).permit(:consumer_id,:order_status,:payment_method,:address,
			:postcode,:name,:postage,:billing_amount,:prefecture_code,:address_city,:address_street,:address_building,
			order_products_attributes: [:product_id, :quantity, :product_status, :price])
	end
end

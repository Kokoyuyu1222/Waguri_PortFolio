class Admins::OrdersController < ApplicationController
	layout 'admin'
	before_action :authenticate_admin!
	def index
		@orders = Order.all
	end
	def show
		@order = Order.find(params[:id])
		@total_price = 0
        @order.order_products.each do |order_product|
          @total_price += (order_product.product.unit_price * order_product.quantity)
      end
	end
	private
	def order_params
		params.require(:order).permit(:consumer_id,:order_status,:payment_method,:address,
			:postcode,:name,:postage,:billing_amount,:prefecture_code,:address_city,:address_street,:address_building,
			order_products_attributes: [:product_id, :quantity, :product_status, :price])
	end
end

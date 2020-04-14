class Consumers::OrdersController < ApplicationController
	layout 'consumer'
	before_action :authenticate_consumer!
	def new
	    @order = Order.new
	    @address = current_consumer.destinations
		@destination = Destination.where(consumer_id: current_consumer)
	end
	def create
		binding.pry
		@order = Order.new(order_params)
		@order.consumer_id = current_consumer.id
	    if @order.save!
	  	cart_products = current_consumer.cart_products
		cart_products.destroy_all
		  redirect_to consumers_orders_finish_path
		else
			render 'confirm'
		end
    end
	def index
		@orders = Order.where(consumer_id: current_consumer)
	end

	def show
		@order = Order.find(params[:id])
	end

	def confirm
		@order = Order.new(order_params)
		@order.order_products.build
		@cart_products = current_consumer.cart_products
		@order.consumer_id = current_consumer.id
		if params[:address_select] == "address1"
			@order.postcode = current_consumer.postcode
			@order.prefecture_code = current_consumer.prefecture_code
			@order.address_city = current_consumer.address_city
			@order.address_street = current_consumer.address_street
			@order.address_building = current_consumer.address_building
			@order.name = current_consumer.name
			@order.address = (@order.prefecture_code.to_s + @order.address_city + @order.address_street + @order.address_building)
		elsif params[:address_select] == "address2"
			@destination = Destination.find(params[:order][:address_id])
			@order.prefecture_code = @destination.prefecture_code
			@order.address_city = @destination.address_city
			@order.address_street = @destination.address_street
			@order.address_building = @destination.address_building
			@order.address = (@order.prefecture_code.to_s + @order.address_city + @order.address_street + @order.address_building)
			@order.name = @destination.name
		else
			params[:address_select] == "address3"
			@order.postcode =  params[:order][:destination][:postcode]
		    @order.address =  params[:order][:destination][:prefecture_code]
		    @order.address =  params[:order][:destination][:address_city]
		    @order.address =  params[:order][:destination][:address_street]
		    @order.address =  params[:order][:destination][:address_building]
			@order.name =  params[:order][:destination][:name]
			@order.address = (@order.prefecture_code.to_s + @order.address_city + @order.address_street + @order.address_building)
		end
    @total_price = 0
    @cart_products.each do |cart_product|
    @total_price += (cart_product.product.unit_price * cart_product.quantity)
    end

	end
	def finish
	end

	def pay
		Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  		Payjp::Charge.create(
    	:postcode => params[:postcode],
    	:prefecture_code => params[:prefecture_code],
    	:address_city => params[:address_city],
    	:address_street => params[:address_street],
    	:address_building => params[:address_building],
    	:name => params[:name],
    	:payment_method => params[:payment_method],
    	:billing_amount => params[:billing_amount],
    	:billing_amount => params[:billing_amount],
    	:card => params['payjp-token'],
    	:currency => 'jpy'
    	 )
	end

	private
	def order_params
		params.require(:order).permit(:consumer_id,:order_status,:payment_method,:address,
			:postcode,:name,:postage,:billing_amount,:prefecture_code,:address_city,:address_street,:address_building,
			order_products_attributes: [:product_id, :quantity, :product_status, :price])
	end

	def destination_params
		params.require(:destination).permit(:consumer_id, :postcode, :name, :address)
	end
end

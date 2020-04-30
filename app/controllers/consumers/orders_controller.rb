class Consumers::OrdersController < ApplicationController
	layout 'consumer'
	require "payjp"
	before_action :authenticate_consumer!
	def new
	    @order = Order.new
	    @address = current_consumer.destinations
		@destination = Destination.where(consumer_id: current_consumer)
		@cards = Card.where(consumer_id: current_consumer.id)
	end
	def create
		@order = Order.new(order_params)
		@order.consumer_id = current_consumer.id
	    if @order.save!
	    	ids = @order.products.select(:fermer_id).distinct.pluck(:fermer_id)
	    	@fermers = Fermer.find(ids)
	    	@fermers.each do |fermer|
		    	ThanksMailer.send_mail_fermer(fermer).deliver_now
		    	ThanksMailer.send_mail_consumer(current_consumer,fermer).deliver_now
	        end
	        @order.order_products.each do |order_product|
	        	quantity = order_product.product.stock.quantity - order_product.quantity
	        	stock = Stock.where(product_id: order_product.product_id)
	        	stock.update(quantity: quantity)
	        end
		  	cart_products = current_consumer.cart_products
			cart_products.destroy_all
			redirect_to consumers_orders_finish_path
		else
			render 'confirm'
		end
    end
	def index
		@orders = Order.where(consumer_id: current_consumer.id )
	end

	def show
		@order = Order.find(params[:id])
	end

	def confirm
		@order = Order.new(order_params)
		@order.order_products.build
		@cart_products = current_consumer.cart_products
		@order.consumer_id = current_consumer.id
		if params[:card_select] == "card1"
			@cards = Card.find_by(consumer_id: current_consumer.id)
			Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
	        customer = Payjp::Customer.retrieve(@cards.customer_id)
	        @default_card_information = customer.cards.retrieve(@cards.payjp_id)
		end
		if params[:address_select] == "address1"
			@order.postcode = current_consumer.postcode
			@order.prefecture_name = current_consumer.prefecture_name
			@order.address_city = current_consumer.address_city
			@order.address_street = current_consumer.address_street
			@order.address_building = current_consumer.address_building
			@order.name = current_consumer.name
			@order.address = (@order.prefecture_name + @order.address_city + @order.address_street + @order.address_building)
		elsif params[:address_select] == "address2"
			@destination = Destination.find(params[:order][:address_id])
			@order.postcode = @destination.postcode
			@order.prefecture_name = @destination.prefecture_name
			@order.address_city = @destination.address_city
			@order.address_street = @destination.address_street
			@order.address_building = @destination.address_building
			@order.address = (@order.prefecture_name + @order.address_city + @order.address_street + @order.address_building)
			@order.name = @destination.name
		else
			params[:address_select] == "address3"
			@order.postcode =  params[:order][:postcode]
		    @order.prefecture_code = params[:order][:prefecture_code]
		    @order.address_city = params[:order][:address_city]
		    @order.address_street = params[:order][:address_street]
		    @order.address_building = params[:order][:address_building]
			@order.name =  params[:order][:name]
			@order.address = (@order.prefecture_name + @order.address_city + @order.address_street + @order.address_building)
		end
    	@total_price = 0
    	@card = params[:order][:card]
    	@cart_products.each do |cart_product|
    		@total_price += (cart_product.product.unit_price * cart_product.quantity)
    	end

	end
	def finish
	end

	def pay
		if params['payjp-token']
		 	Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
	  		charge = Payjp::Charge.create(
		        :amount => params[:order][:billing_amount],
		    	:card => params['payjp-token'],
		    	:currency => 'jpy'
	    	)
	  	else
	  		Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
	  		charge = Payjp::Charge.create(
		        :amount => params[:order][:billing_amount],
		        :currency => 'jpy',
		    	:customer => params[:order][:customer_id]
	    	)
	  	end
    	@order = Order.new(order_params)
		@order.consumer_id = current_consumer.id
	    if @order.save!
	    	ids = @order.products.select(:fermer_id).distinct.pluck(:fermer_id)
	    	@fermers = Fermer.find(ids)
	    	@fermers.each do |fermer|
	     		ThanksMailer.send_mail_fermer(fermer).deliver_now
	     		ThanksMailer.send_mail_consumer(current_consumer,fermer).deliver_now
	    	end
	  	cart_products = current_consumer.cart_products
		cart_products.destroy_all
		  redirect_to consumers_orders_finish_path
		else
			render 'confirm'
		end

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

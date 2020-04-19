class Consumers::CartProductsController < ApplicationController
	layout 'consumer'
  	def index
		@cart_product = CartProduct.new
		@cart_products = CartProduct.where(consumer_id: current_consumer)
		@total_price = 0
    @cart_products.each do |cart_product|

    @total_price += (cart_product.product.unit_price * cart_product.quantity)
    end
	end

	def create
		@cart_product = CartProduct.new(cart_product_params)
		@cart_product.consumer_id = current_consumer.id
		if @cart_product.save
			redirect_to consumers_cart_products_path(@cart_product)
		else
			flash[:notice] = "申し訳ございません購入数が在庫数を超えています"
			redirect_to consumers_products_path
		end
	end

    def update
      @cart_product = CartProduct.find(params[:id])
  	  @cart_product.update!(cart_product_params)
  	  @consumer = Consumer.find(current_consumer.id)
  	  redirect_back(fallback_location: consumers_cart_products_path)
  	end

    def destroy
      @cart_product = CartProduct.find(params[:id])
	  @cart_product.destroy
	  redirect_back(fallback_location: consumers_cart_products_path)
    end

    def destroy_all
	  consumer = Consumer.find(current_consumer.id)
	 if consumer.cart_products.destroy_all
	 	flash[:notice] = "カートの商品を全て削除しました。"
	  redirect_to consumers_products_path
	else
		render 'index'
	end
    end

  private

    def cart_product_params
	  params.require(:cart_product).permit(:consumer_id,:product_id,:quantity,:unit_price)
    end

  end


class Consumers::ProductCommentsController < ApplicationController
	layout 'consumer'
	before_action :authenticate_consumer!
	def create
	    @product = Product.find(params[:product_id])
		@comment = @product.product_comments.build(product_comment_params)
		@comment.consumer_id = current_consumer.id
		 if @comment.save
		 	flash[:success] = "Comment was successfully created."
		 	render 'index'
		 else
           redirect_to consumers_products_path(@product)
         end
	end

	def destroy
	    @product = Product.find(params[:product_id])
		@comments = @product.product_comments
		@comment = current_consumer.product_comments.find(params[:id])
		@comment.destroy
	end

	private
	def product_comment_params
		params.require(:product_comment).permit(:comment, :consumer_id, :product_id,:rate,:title)
	end
end

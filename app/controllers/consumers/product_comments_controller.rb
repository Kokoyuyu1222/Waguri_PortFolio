class Consumers::ProductCommentsController < ApplicationController
	layout 'consumer'
	def create
	    @product = Product.find(params[:product_id])
		@comment = @product.product_comments.build(product_comment_params)
		@comment.consumer_id = current_consumer.id
		 if @comment.save
		 	render :index
		 end
	end

	def destroy
		@product = Product.find(params[:product_id])
		@comment = current_consumer.product_comments.find(params[:id])
		if @comment.destroy
			render :index
		end
	end

	private
	def product_comment_params
		params.require(:product_comment).permit(:comment, :consumer_id, :product_id)
	end
end

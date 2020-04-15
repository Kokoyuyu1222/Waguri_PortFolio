class Consumers::ProductCommentsController < ApplicationController
	layout 'consumer'
	def create
	    @product = Product.find(params[:product_id])
		@comment = @product.product_comments.build(product_comment_params)
		@comment.consumer_id = current_consumer.id
		 if @comment.save
		 	flash[:success] = "Comment was successfully created."
		 else
           @book_comments = BookComment.where(id: @book)
         end
	end

	def destroy
		@product_comment = ProductComment.find(params[:product_id])
        @product = @product_comment.product
	    @product = Product.find(params[:product_id])
		@comment = current_consumer.product_comments.find(params[:id])
		if @book_comment.user != current_user
           redirect_to request.referer
        else
		@comment.destroy
	   end
	end

	private
	def product_comment_params
		params.require(:product_comment).permit(:comment, :consumer_id, :product_id,:rate,:title)
	end
end

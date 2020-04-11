class Consumers::ColumnCommentsController < ApplicationController
	layout 'consumer'
	def create
		@column = Column.find(params[:column_id])
		@comment = @column.column_comments.build(column_comment_params) #②
		@comment.consumer_id = current_consumer.id
		 if @comment.save
		 	render :index
		 end
		end

		def destroy
			@column = Column.find(params[:column_id])
			@comment = current_fermer.column_comments.find(params[:id])
			if @comment.destroy
				render :index
			end
		end

		private
		def column_comment_params
			params.require(:column_comment).permit(:comment, :consumer_id, :column_id,:fermer_id)
		end
	end

end

class Consumers::ColumnCommentsController < ApplicationController
	layout 'consumer'
	def create
	    @column = Column.find(params[:column_id])
		@comment = @column.column_comments.build(column_comment_params)
		@comments = @column.column_comments
		@comment.consumer_id = current_consumer.id
		@comment.save
	end

	def destroy
		@column = Column.find(params[:column_id])
		@comment = current_consumer.column_comments.find(params[:id])
		@comment.destroy
	end

	private
	def column_comment_params
			params.require(:column_comment).permit(:comment, :consumer_id, :column_id)
	end

end

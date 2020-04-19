class Consumers::ColumnsController < ApplicationController
	layout 'consumer'
	def index
		binding.pry
		if params[:fermer_id]
			@columns = Column.where(fermer_id: params[:fermer_id])
		else
			@columns = Column.all
		end
	end

	def show
		@column = Column.find(params[:id])
		@consumer = Consumer.find(@column.fermer_id)
		@comment = ColumnComment.new
		@comments = @column.column_comments
		@favorite = ColumnFavorite.new
	end
	private
	def column_params
		params.require(:column).permit(:title, :body,:fermer_id)
	end
end

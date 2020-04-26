class Admins::ColumnsController < ApplicationController
	layout 'admin'
	def index
		@columns = Column.all
	end
	def show
		@column = Column.find(params[:id])
	end
	private
	def column_params
		params.require(:column).permit(:title, :body,:fermer_id)
	end
end

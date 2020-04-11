class Consumers::ColumnFavoritesController < ApplicationController
	layout 'consumer'
	before_action :book_params
	def create
		@favorite = Favorite.create(consumer_id: current_consumer.id, column_id: @column.id)
            # redirect_to request.referer
        end
        def destroy
        	@favorite = Favorite.find_by(consumer_id: current_consumer.id, column_id: @column.id).destroy
        end
        private
        def favorite_params
        	params.require_params(:favorite).permit(:column_id)
        end
        def column_params
        	@column = Column.find(params[:column_id])
        end
end

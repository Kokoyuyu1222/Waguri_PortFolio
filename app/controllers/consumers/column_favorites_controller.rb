class Consumers::ColumnFavoritesController < ApplicationController
	layout 'consumer'
    before_action :authenticate_consumer!
	before_action :column_params
	def create
        @column = Column.find(params[:column_id])
        @favorite = @column.column_favorites.new(consumer_id: current_consumer.id)
        @favorite.save
    end
    def destroy
        @column = Column.find(params[:column_id])
        @favorite = current_consumer.column_favorites.find_by(column_id: @column.id)
        @favorite.destroy!
    end
    private
    def favorite_params
        params.require_params(:favorite).permit(:column_id)
    end
    def column_params
        @column = Column.find(params[:column_id])
    end
    def redirect
      case params[:redirect_id].to_i
      when 0
        redirect_to consumers_columns_path
      when 1
        redirect_to consumers_column_path(@column)
      end
    end
end

class Fermers::ColumnsController < ApplicationController
   layout 'fermer'
	def index
     @columns = Column.all.includes(:column_images)
  end
  def new
  	@column = Column.new
  	@column.column_images.build
  end
  def create
  	@column = Column.new(column_params)
    params[:images_attributes][:"0"][:image].each do |image|
      @column.column_images.build(column_image)
    end
    @column.save
    redirect_to fermers_columns_path(@pcolumn)
  end
  def show
  	@column = Column.find(params[:id])
  end
  def edit
  	@column = Column.find(params[:id])
  end
  def update
  	@column = Column.find(params[:id])
    if @column.update(column_params)
     redirect_to fermers_column_path(@column)
   else
     render 'edit'
   end
 end
 def destroy
   @column = Column.find(params[:id])
   @column.destroy
   redirect_to admins_columns_path
 end
 private
 def column_params
   params.require(:product).permit(:title,:body, column_images_images: [])
 end


end

class Fermers::ColumnsController < ApplicationController
 layout 'fermer'
 def index
  if params[:fermer_id]
    @columns = Column.where(fermer_id: params[:fermer_id])
  else
    @columns = Column.all
  end
end
def new
  @column = Column.new
  @column.column_images.build
end
def create
  @column = Column.new(column_params)
  @column.fermer_id = current_fermer.id
  if @column.save!
    redirect_to fermers_column_path(@column)
  else
    render "new"
  end
end
def show
   @column = Column.find(params[:id])
   @fermer = current_fermer
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
  params.require(:column).permit(:title,:body,:fermer_id,column_images_images:[])
end


end

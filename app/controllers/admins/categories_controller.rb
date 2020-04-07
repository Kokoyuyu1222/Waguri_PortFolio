class Admins::CategoriesController < ApplicationController
	layout 'admin'
  def index
  	@categories = Category.all
  	@category = Category.new
  end

  def create
  	binding.pry
  	@category = Category.new(category_params)
  	@category.save
  	redirect_back(fallback_location: admins_categories_path(@category))
  end

  def edit
  	@category = Category.find(params[:id])
  end
  def update
  	@category = Category.find(params[:id])
  	if @category.update(category_params)
  		redirect_to admins_categories_path
  	else
  		redirect_to edit_admins_categories_path
		end
  end
  private
  def category_params
		params.require(:category).permit(:name,:category_status)
	end
end

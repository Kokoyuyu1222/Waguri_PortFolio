class Admins::BrandsController < ApplicationController
  layout 'admin'
  def index
  	@brands = Brand.all
  	@brand = Brand.new
  end

  def create
  	@brand = Brand.new(genre_params)
    @brand.save
	redirect_back(fallback_location: admins_brands_path(@brand))
  end

  def edit
  	@brand = Brand.find(params[:id])
  end


  def update
  	@brand = Brand.find(params[:id])
  	if @brand.update(brand_params)
  		redirect_to admins_brands_path
  	else
  		redirect_to edit_admins_brands_path
  	end
  end
  private
    def brand_params
		params.require(:brand).permit(:name,:status,:category_id)
	end
end

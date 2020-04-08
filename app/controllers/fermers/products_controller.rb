class Fermers::ProductsController < ApplicationController
	layout 'fermer'
  def index
  	@categories = Category.where(category_status: "draft")
  	if params[:genre_id]
		@products = Product.where(genre_id: params[:genre_id])
	else
		@products = Product.joins(:category).where("(category_status = ?)",false)
	end
  end
  def new
  	@product = Product.new
  	@categories = Category.where(category_status: "draft")
  end
  def create
  	@product = Product.new(product_params)
		@product.save
		redirect_to fermers_products_path(@product)
  end
  def show
  	@product = Product.find(params[:id])
  end
  def edit
  	@product = Product.find(params[:id])
  end
  def update
  	@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to fermers_product_path(@product)
		else
			render 'edit'
		end
  end
  def destroy
  	@product = Product.find(params[:id])
		@product.destroy
		redirect_to admins_products_path
  end
  private
  def product_params
  	params.require(:product).permit(:name,:sale_status,:introduction,:category_id,:brand_id,:image_id,:quantity,:stock_id,:fermer_id,:unit_price)
  end
end

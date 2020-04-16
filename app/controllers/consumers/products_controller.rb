class Consumers::ProductsController < ApplicationController
	layout 'consumer'
  def index
  	@categories = Product.includes(brand: :category).where(categories: {category_status: false})
  	@blands = Product.joins(:brand).where(brands:  {brand_status: false})
  	if params[:fermer_id]
  		@products = Product.joins({:brand => :category}).where(fermer_id: params[:fermer_id]).where("(category_status = ?) AND (brand_status = ?) AND (sale_status = ?)",false,false,0)
  	elsif params[:category_id]
  		@products = Product.joins(:brand).where("(brand_status = ?) AND (sale_status = ?)",false,0)
  	elsif params[:brand_id]
  	    @products = Product.where(sale_status: "draft")
  	else
  		@products = Product.joins({:brand => :category}).where("(category_status = ?) AND (brand_status = ?) AND (sale_status = ?)",false,false,0)
  	end
  end

  def show
  	@product = Product.find(params[:id])
    @cart = CartProduct.new
    @comment = ProductComment.new
    @comments = @product.product_comments
  end
  private
  def product_params
  	params.require(:product).permit(:name,:sale_status,:introduction,:category_id,:brand_id,:quantity,:stock_id,:fermer_id,:unit_price,product_images_images: [])
  end
end


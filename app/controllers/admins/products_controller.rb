class Admins::ProductsController < ApplicationController
	layout 'admin'
  def index
  	@products = Product.all
  end
  def show
  	@product = Product.find(params[:id])
    @comments = @product.product_comments
  end
  private
  def product_params
    params.require(:product).permit(:name,:sale_status,:introduction,:category_id,:brand_id,:quantity,:stock_id,:fermer_id,:unit_price,product_images_images: [])
  end
end

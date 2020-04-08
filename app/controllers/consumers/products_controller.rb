class Consumers::ProductsController < ApplicationController
	layout 'consumer'
  def index
  end

  def show
  end
  private
  def product_params
  	params.require(:product).permit(:name,:sale_status,:introduction,:category_id,:brand_id,:image_id,:quantity,:stock_id,:fermer_id,:unit_price)
  end
end

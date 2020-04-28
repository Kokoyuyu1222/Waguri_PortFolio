class Fermers::ProductsController < ApplicationController
	layout 'fermer'
  def index
    if params[:fermer_id]
      @products = Product.includes(brand: :category).where(categories: {category_status: false},fermer_id: current_fermer.id).page(params[:page]).reverse_order
    else
      @products =Product.all
    end
    respond_to do |format|
      format.html do
      end
      format.csv do
          send_data render_to_string, filename: "(ファイル名).csv", type: :csv
      end
    end
  end
  def new
  	@product = Product.new
    @product.product_images.build
    @categories = Category.where(category_status: 'draft').order("name")
    @brands = Brand.where(brand_status: 'draft').order("name")
    @category = Category.new
    @product.build_stock

  end
  def filter_brand
    @product = Product.new
    @product.build_stock
    # @stock = Stock.new
    @product.product_images.build
    @product.category_id = params["category"]["id"]
    @categories = Category.where(category_status: 'draft').order("name")
    @brands = Brand.where(brand_status: 'draft')
    .where(category_id: params["category"]["id"])
    .order("name")
    @category = Category.new
    @category.id = params["category"]["id"]
    render "new"
  end
  def create
  	@product = Product.new(product_params)
    # @product.stock.build(stock_params)
    @product.fermer_id = current_fermer.id
    @product.save
    redirect_to fermers_product_path(@product)
  end
  def show
  	@product = Product.find(params[:id])
  end
  def edit
  	@product = Product.find(params[:id])
    @product.product_images.build
    @categories = Category.where(category_status: 'draft').order("name")
    @brands = Brand.where(brand_status: 'draft').order("name")
    @category = Category.new
    @product.stocks.build
  end
  def update
  	@product = Product.find(params[:id])
    if @product.update(product_params)
     redirect_to fermers_product_path(@product)
   else
     render 'edit'
   end
 end
 def sale_status
   
 end
 def destroy
   @product = Product.find(params[:id])
   @product.destroy
   redirect_to fermers_products_path
 end
 private
 def product_params
   params.require(:product).permit(:name,:sale_status,:introduction,:category_id,:brand_id,:quantity,:stock_id,:fermer_id,:unit_price, product_images_images: [],stock_attributes: [:product_id, :quantity])
 end
end

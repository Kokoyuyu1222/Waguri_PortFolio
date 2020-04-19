class Fermers::ProductsController < ApplicationController
	layout 'fermer'
  require 'csv'
  def index
  	if params[:category_id]
      @products = Product.where(category_id: params[:category_id],fermer_id: current_fermer_id)
    else
      @products = Product.includes(brand: :category).where(categories: {category_status: false})
    end
    respond_to do |format|
      format.html do
       @products = Product.includes(brand: :category).where(categories: {category_status: false})
      end
      format.csv do
        send_data output_csv,
        filename: "商品情報.csv"
      end
    end
  end

  def output_csv
    CSV.generate do |csv|
      csv << Product.column_names
      Product.pluck(*Product.column_names).each{|data|csv << data}
    end
  end
  def new
  	@product = Product.new
    @product.product_images.build
    @categories = Category.where(category_status: 'draft').order("name")
    @brands = Brand.where(brand_status: 'draft').order("name")
    @category = Category.new
    @product.stocks.build
  end
  def filter_brand
    @product = Product.new
    @product.stocks.build
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
    @product.fermer_id = current_fermer.id
    @product.save
    redirect_to fermers_product_path(@product)
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
 def sale_status
   
 end
 def destroy
   @product = Product.find(params[:id])
   @product.destroy
   redirect_to admins_products_path
 end
 private
 def product_params
   params.require(:product).permit(:name,:sale_status,:introduction,:category_id,:brand_id,:quantity,:stock_id,:fermer_id,:unit_price, product_images_images: [],stocks_attributes: [:product_id, :quantity])
 end
end

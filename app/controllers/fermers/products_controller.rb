class Fermers::ProductsController < ApplicationController
	layout 'fermer'
  def index
  	if params[:category_id]
      @products = Product.where(category_id: params[:category_id])
      # @categories = Producte.all.includes({:brand => :category}).where(category_status: "draft")
    else
      @products = Product.includes(brand: :category).where(categories: {category_status: false})
      # @categories = Product.all.includes({:brand => :category}).where(category_status: "draft")
    end
  end
  def new
  	@product = Product.new
    @product.product_images.build
    @categories = Category.where(category_status: 'draft').order("name")
    @brands = Brand.where(brand_status: 'draft').order("name")
    @category = Category.new
  end
  def filter_brand
    @product = Product.new
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
 def destroy
   @product = Product.find(params[:id])
   @product.destroy
   redirect_to admins_products_path
 end
 private
 def product_params
   params.require(:product).permit(:name,:sale_status,:introduction,:category_id,:brand_id,:quantity,:stock_id,:fermer_id,:unit_price, product_images_images: [])
 end
end

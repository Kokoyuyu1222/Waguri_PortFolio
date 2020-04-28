class ApplicationController < ActionController::Base
  before_action :set_side
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def set_side
    @side_categories = Category.eager_load(:brands).where("(category_status = ?) AND (brand_status = ?)",false,false)
    @side_products = Product.joins({:brand => :category}).where("(category_status = ?) AND (brand_status = ?) AND (sale_status = ?)",false,false,0).order("RAND()").limit(3)
    @columns = Column.order("RAND()").limit(3)
  end

  protected

  def configure_permitted_parameters
    if resource_class == Consumer
      devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name, :first_name, :kana_last_name, :kana_first_name, :postcode,:prefecture_code, :address_city, :address_street, :address_building,:gender,:age,:phone])
    else
      devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name, :first_name, :kana_last_name, :kana_first_name, :postcode,:prefecture_code, :address_city, :address_street, :address_building, :phone,:garden,:home_page])
    end
  end

  private

  def after_sign_up_path_for(resource)
  	case resource
  	when Consumer
  		consumers_consumer_path(current_consumer)
  	when Fermer
  		fermers_fermer_path(current_fermer)
  	end
  end


  def after_sign_in_path_for(resource)
    case resource
  	when Admin
  		admins_homes_top_path
  	when Consumer
      if current_consumer.withdraw == "published"
      sign_out(current_consumer)
      else
       consumers_consumer_path(current_consumer)
      end
    when Fermer
      if current_fermer.withdraw == "published"
      sign_out(current_fermer)
      else
  		fermers_fermer_path(current_fermer)
  	  end
  	end
  end
end
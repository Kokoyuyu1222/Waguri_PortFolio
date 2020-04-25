class ApplicationController < ActionController::Base

  # before_action :set_product
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

# 　def set_product
#     @categories = Category.joins(:brand).where("(category_status = ?) AND (brand_status = ?)",false,false)
#     @consumer = current_consumer
#     @s = Product.all
#     @all_ranks = Column.find(ColumnFavorite.group(:column_id).order('count(column_id) desc').limit(10).pluck(:column_id))
#   end
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
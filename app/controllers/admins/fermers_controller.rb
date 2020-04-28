class Admins::FermersController < ApplicationController
	layout 'admin'
  before_action :authenticate_admin!
  def index
  	@fermers = Fermer.all
  end
  def show
  	@fermer = Fermer.find(params[:id])
    @reviews = @fermer.fermer_reviews
  end
  private
  def fermer_params
  	params.require(:fermer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postcode,:prefecture_code, :address_city, :address_street, :address_building, :phone,:garden,:home_page,:profile_image)
  end
end

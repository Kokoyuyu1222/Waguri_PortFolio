class Admins::FermersController < ApplicationController
	layout 'admin'
  def index
  	@Fermers = Fermer.all
  end
  private
  def fermer_params
  	params.require(:fermer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postcode,:prefecture_code, :address_city, :address_street, :address_building, :phone,:garden,:home_page)
  end
end

class Fermers::FermersController < ApplicationController
  layout 'fermer'
  def show
  	@fermer = Fermer.find(params[:id])
  end
  def edit
  	
  end
  def update
  	
  end

  private
  def fermer_params
       params.require(:fermer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name,:garden,:home_page,:prefecture_code, :address_city,:address_street,:address_building, :postcode, :phone, :email,:withdraw)
    end
end

class Fermers::FermersController < ApplicationController
  layout 'fermer'
  def show
  	@fermer = Fermer.find(params[:id])
  end
  def edit
    @fermer = Consumer.find(params[:id])
    unless current_fermer.nil? || current_fermer.id == current_fermer.id
      flash[:warning] = "アクセス権がありません"
      redirect_to fermers_fermer_path(current_fermer)
    end
  end
  def update
    if current_fermer.update(fermer_params)
      flash[:success] =  "更新に成功しました"
      redirect_to fermers_fermer_path(current_fermer)
    else
      flash[:warning] = "入力内容を確認してください"
      render :edit
    end
  end
  def change
    current_fermer.update(withdraw: true)
    reset_session
    redirect_to root_path
  end

  private
  def fermer_params
       params.require(:fermer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name,:garden,:home_page,:prefecture_code, :address_city,:address_street,:address_building, :postcode, :phone, :email,:withdraw)
    end
end

class Admins::ConsumersController < ApplicationController
	layout 'admin'
  def index
  	@consumers = Consumer.all
  end
  private
  def consumer_params
  	params.require(:consumer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postcode,:prefecture_code, :address_city, :address_street, :address_building,:gender,:age,:phone)
  end
end

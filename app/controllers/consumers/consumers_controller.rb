class Consumers::ConsumersController < ApplicationController
 layout 'consumer'
  def show
  	@consumer = Consumer.find(params[:id])
    @card = Card.new
    @cards = Card.find_by(consumer_id: current_consumer.id)
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #         customer = Payjp::Customer.retrieve(@cards.customer_id)
  #         @default_card_information = customer.cards.retrieve(@cards.payjp_id)
   end
  def edit
  	@consumer = Consumer.find(params[:id])
  	unless current_consumer.nil? || current_consumer.id == current_consumer.id
			flash[:warning] = "アクセス権がありません"
			redirect_to consumer_path(current_consumer)
		end
  end
  def update
  	if current_consumer.update(consumer_params)
			flash[:success] =  "更新に成功しました"
			redirect_to consumers_consumer_path(current_consumer)
		else
			flash[:warning] = "入力内容を確認してください"
			render :edit
		end
  end
  def change
    current_consumer.update(withdraw: true)
    reset_session
    redirect_to root_path
  end

  private
   def consumer_params
       params.require(:consumer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name,:gender,:age,:prefecture_code, :address_city,:address_street,:address_building, :postcode, :phone, :email,:withdraw,:profile_image)
    end

end

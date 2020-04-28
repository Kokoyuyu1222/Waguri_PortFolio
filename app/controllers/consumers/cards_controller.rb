class Consumers::CardsController < ApplicationController
	layout 'consumer'
  before_action :authenticate_consumer!
	require "payjp"
	def create
		@consumer = current_consumer
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if params['payjp-token'].blank?
      redirect_to consumers_consumer_path(@consumer)
    else
        customer = Payjp::Customer.create(
        description: '登録テスト',
        email: current_consumer.email,
        card: params['payjp-token'],
        metadata: {consumer_id: current_consumer.id}
        )
        @card = Card.new(consumer_id: current_consumer.id, customer_id: customer.id, payjp_id: customer.default_card)
        if @card.save
          redirect_to consumers_consumer_path(@consumer)
        else
         redirect_to consumers_consumer_path(@consumer)
        end
    end
  end
  def destroy
    @card = Card.find_by(consumer_id: current_consumer.id)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @customer = Payjp::Customer.retrieve(@card.customer_id)
    @customer.delete
    @card.delete
    redirect_to consumers_consumer_path(current_consumer)
  end
end


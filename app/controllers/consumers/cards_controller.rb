class Consumers::CardsController < ApplicationController
	layout 'consumer'
	require "payjp"
	def create
		@consumer = current_consumer
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     if params['payjp-token'].blank?
         redirect_back(fallback_location: consumers_consumer_path(@consumer)
    else
        customer = Payjp::Customer.create(
        description: '登録テスト',
        email: current_consumer.email,
        card: params['payjp-token'],
        metadata: {consumer_id: current_consumer.id}
       )
        @card = Card.new(consumer_id: current_consumer.id, customer_id: customer.id, payjp_id: customer.default_card)
        if @card.save
          redirect_back(fallback_location: consumers_consumer_path(@consumer))
        else
         redirect_back(fallback_location: consumers_consumer_path(@consumer))
        end
    end
  end
  def delete
    @card = Card.where(consumer_id: current_consumer.id).first
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @customer = Payjp::Customer.retrieve(card.customer_id)
    @customer.delete
    @card.delete
    redirect_back(fallback_location: consumers_consumer_path)
  end
  def show
    card = Card.where(consumer_id: current_consumer.id)
    if card.blank?
      redirect_to consumers_consumer_path(@consumer)
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.payjp_id)
    end
  end
end
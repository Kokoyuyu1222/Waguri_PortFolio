class Consumers::CardsController < ApplicationController
	layout 'consumer'
	def create
	    Payjp.api_key = 'sk_test_391bacaf80f8d17d38ea266e'
	    customer = Payjp::Customer.create(card: params[:payjpToken])
	    @card = Card.new(consumer_id: current_consumer.id, customer_id: customer.id, payjp_id: params[:payjpToken])
		    if @card.save
		      redirect_to Consumers_consumer_path(current_consumer)
		    else
		      redirect_to Consumers_consumer_path(current_consumer)
		    end
	end
end

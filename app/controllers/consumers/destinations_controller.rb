class Consumers::DestinationsController < ApplicationController
	layout 'consumer'
	before_action :authenticate_consumer!
	def index
		@destination = Destination.new
		@destinations = Destination.all
	end

	def create
		@destination = Destination.new(destination_params)
		@destination.consumer_id = current_consumer.id
		if @destination.save!
			@destination.update(address: @destination.prefecture_name + @destination.address_city + @destination.address_street + @destination.address_building)
			redirect_back(fallback_location: consumers_destinations_path)
		else
			redirect_back(fallback_location: consumers_destinations_path)
		end
	end

	def edit
		@destination = Destination.find(params[:id])
	end

	def update
		@destination = Destination.find(params[:id])
		if @destination.update(destination_params)
			redirect_to members_destinations_path
		else
			redirect_to members_destinations_path
		end
    end
	def destroy
		@destination = Destination.find(params[:id])
		@destination.destroy
		redirect_to consumers_destinations_path
	end


private

	def destination_params
		params.require(:destination).permit(:consumer_id,:prefecture_code,:address_city,:address_street,:address_building, :postcode, :name, :address)
	end
end


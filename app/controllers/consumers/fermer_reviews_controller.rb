class Consumers::FermerReviewsController < ApplicationController
	layout 'consumer'
	def create
		binding.pry
	    @fermer = Fermer.find(params[:fermer_id])
		@review = @fermer.fermer_reviews.build(fermer_review_params)
		@reviews = @fermer.fermer_reviews
		@review.consumer_id = current_consumer.id
		@review.save
	end

	def destroy
	    @fermer = Fermer.find(params[:fermer_id])
	    @reviews = @fermer.fermer_reviews
		@review = current_consumer.fermer_reviews.find(params[:id])
		@review.destroy
	end

	private
	def fermer_review_params
		params.require(:fermer_review).permit(:comment, :consumer_id, :fermer_id,:rate,:title)
	end
end

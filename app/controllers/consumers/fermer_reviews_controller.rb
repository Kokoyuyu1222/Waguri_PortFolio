class Consumers::FermerReviewsController < ApplicationController
	layout 'consumer'
	def create
	    @fermer = Fermer.find(params[:fermer_id])
		@review = @fermer.fermer_review.build(fermer_review_params)
		@review.consumer_id = current_consumer.id
		@comment.save
	end

	def destroy
	    @fermer = Feremer.find(params[:fermer_id])
		@review = current_consumer.fermer_reviews.find(params[:id])
		@comment.destroy
	   end
	end

	private
	def fermer_review_params
		params.require(:fermer_review).permit(:comment, :consumer_id, :fermer_id,:rate,:title)
	end
end

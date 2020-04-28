class Consumers::BookMarksController < ApplicationController
	layout 'consumer'
  before_action :authenticate_consumer!
	def create
      @fermer = Fermer.find(params[:fermer_id])
      @book_mark = @fermer.book_marks.new(consumer_id: current_consumer.id)
      @book_mark.save
  end
  def destroy
      @fermer = Fermer.find(params[:fermer_id])
      @book_mark = current_consumer.book_marks.find_by(fermer_id: @fermer.id)
      @book_mark.destroy!
  end

  private
  def redirect
    case params[:redirect_id].to_i
    when 0
      redirect_to consumers_fermers_path
    when 1
      redirect_to consumers_fermers_path(@fermer)
    end
  end
end

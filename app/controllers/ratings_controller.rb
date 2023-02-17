class RatingsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @rating = @review.ratings.create(rating_params)
    redirect_to movie_path(@review.movie)
  end

  private

   def rating_params
    params.require(:rating).permit(:e_rating, :l_rating, :c_rating, :review_id)
   end
   
end

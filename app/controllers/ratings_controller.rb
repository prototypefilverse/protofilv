class RatingsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @rating = Rating.find_or_initialize_by(review_id: @review.id)
    @rating.assign_attributes(rating_params)
    if @rating.save
      current_user.ratings << @rating
      redirect_to movie_path(@review.movie)
    else
      render :new
    end
  end

  private

   def rating_params
    params.require(:rating).permit(:e_rating, :l_rating, :c_rating, :review_id)
   end
   
end


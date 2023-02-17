class RatingsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @rating = current_user.ratings.find_by(review_id: @review.id)
    @rating = Rating.new(review_id: @review.id) unless @rating.present?

    @rating.assign_attributes(rating_params)
    if @rating.save
      current_user.user_ratings.find_or_create_by(rating_id: @rating.id)
      redirect_to movie_path(@review.movie)
    else
      render 'movies/show'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:e_rating, :l_rating, :c_rating)
  end
end

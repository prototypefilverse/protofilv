class RatingsController < ApplicationController

  before_action :authenticate_user!

  def create

    current_user_filv = current_user.filv
    current_user_filv.update(
      strength: current_user_filv.strength + 1,
      intelligence: current_user_filv.intelligence + 1,
      charisma: current_user_filv.charisma + 1
    )

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

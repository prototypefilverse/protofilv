class RatingsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @rating = @review.ratings.build(rating_params)
    if @rating.save
      redirect_to movie_reviews_path(@review.movie), notice: "レビューを評価しました。"
    else
    render :new
    end
  end

  private

   def rating_params
    params.require(:rating).permit(:e_rating, :l_rating, :c_rating)
   end
   
end

class ReviewsController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new(review_params)
    @review.reviewer = current_user
    if @review.save
      redirect_to movie_path(@movie), notice: "レビューが投稿されました"
    else
      render :new
    end

  end

  private
  
  def review_params
   params.require(:review).permit(:content)
  end

end

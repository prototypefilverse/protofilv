class ReviewsController < ApplicationController

 def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new
  end 
    
  def create
    @movie = Movie.find(params[:movie_id])
    @reviewer = current_user.reviewer

    if Review.where(reviewer_id: @reviewer.id, movie_id: @movie.id).present?
      redirect_to new_movie_review_path(@movie), alert: '投稿に失敗しました。お使いのユーザーidはこの映画のレビューをすでに投稿しています。'
      return
    end

    @review = @reviewer.reviews.new(review_params)
    @review.movie = @movie
    if @review.save
      redirect_to root_path(movie_id: params[:movie_id])
    else
      render :new
    end
  end
    
    private
    
    def review_params
      params.require(:review).permit(:review_title, :review_content, :e_rating, :l_rating, :c_rating)
    end
end

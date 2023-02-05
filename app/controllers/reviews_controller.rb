class ReviewsController < ApplicationController

 def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new
  end 
    
  def create
    @movie = Movie.find(params[:movie_id])
    @reviewer = current_user.reviewer
    @review = @reviewer.reviews.new(review_params)
    @review.movie = @movie
    if @review.save
      redirect_to  movie_reviews_path(@movie)
    else
      render :new
    end
  end
    
    private
    
    def review_params
      params.require(:review).permit(:content, :e_rating, :l_rating, :c_rating, :movie_id)
    end

end

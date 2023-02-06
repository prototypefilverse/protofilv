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
      redirect_to root_path
    else
      render :new
    end
  end
    
    private
    
    def review_params
      params.require(:review).permit(:review_title, :review_content, :e_rating, :l_rating, :c_rating)
    end

end

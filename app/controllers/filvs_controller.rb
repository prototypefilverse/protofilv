class FilvsController < ApplicationController

  def index

    if params[:movie_id].present?
      @movie = Movie.find(params[:movie_id]) 
      @reviews = @movie.reviews.order("RANDAM()").limit(10)
    end
  
    if user_signed_in?
      @filv = current_user.filv
    end
    
  end

end

class FilvsController < ApplicationController

    def index
      @movie = Movie.find(params[:movie_id]) 
      @reviews = @movie.reviews
     if user_signed_in?
      @filv = current_user.filv
     end
    end

end

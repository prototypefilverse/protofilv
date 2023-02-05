class FilvsController < ApplicationController

    def index
      @movie = Movie.find(1)  
      @reviews = @movie.reviews
     if user_signed_in?
      @filv = current_user.filv
     end
    end

end

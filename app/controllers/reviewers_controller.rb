class ReviewersController < ApplicationController

  def index
    @reviews = Review.where(reviewer_id: current_user.id)
    end
    

end

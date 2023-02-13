class ReviewersController < ApplicationController

  def index
    @reviews = Review.where(reviewer_id: current_user.id).order(created_at: :desc).limit(10)
    end
    

end

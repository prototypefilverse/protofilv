class ReviewersController < ApplicationController

  def index
    @reviews = Review.where(reviewer_id: current_user.id).order(created_at: :desc).limit(10)
    end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviewers_path
  end   
    

end

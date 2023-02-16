class UserRating < ApplicationRecord
  
  belongs_to :rating
  belongs_to :user

end

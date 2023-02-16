class Rating < ApplicationRecord

  belongs_to :review

  has_many :user_ratings
  has_many :users, through: :user_ratings

end

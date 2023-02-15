class Review < ApplicationRecord

  belongs_to :movie
  belongs_to :reviewer
  has_many :ratings

end

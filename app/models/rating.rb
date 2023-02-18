class Rating < ApplicationRecord

  belongs_to :review

  has_many :user_ratings
  has_many :users, through: :user_ratings

  after_create :update_filv

  private

  def update_filv
    filv = self.review.reviewer.user.filv
    filv.update(
    strength: filv.strength + self.e_rating,
    intelligence: filv.intelligence + self.l_rating,
    charisma: filv.charisma + self.c_rating
    )
  end
  
end

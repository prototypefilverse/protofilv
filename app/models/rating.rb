class Rating < ApplicationRecord

  belongs_to :review

  has_many :user_ratings
  has_many :users, through: :user_ratings

  after_create :update_filv
  after_destroy :remove_from_filv
  after_update :update_filv_on_update

  private

  def update_filv
    filv = self.review.reviewer.user.filv
    filv.update(
    strength: filv.strength + self.e_rating,
    intelligence: filv.intelligence + self.l_rating,
    charisma: filv.charisma + self.c_rating
    )
  end
  
  def remove_from_filv
    filv = self.review.reviewer.user.filv
    filv.update(
      strength: filv.strength - self.e_rating,
      intelligence: filv.intelligence - self.l_rating,
      charisma: filv.charisma - self.c_rating
    )
  end

  def update_filv_on_update
    filv = self.review.reviewer.user.filv
    prev_e_rating, prev_l_rating, prev_c_rating = self.saved_changes["e_rating"], self.saved_changes["l_rating"], self.saved_changes["c_rating"]
    if prev_e_rating.present? && prev_l_rating.present? && prev_c_rating.present?
      filv.update(
        strength: filv.strength + self.e_rating - prev_e_rating[0],
        intelligence: filv.intelligence + self.l_rating - prev_l_rating[0],
        charisma: filv.charisma + self.c_rating - prev_c_rating[0]
      )
    end  
  end

end

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
  
    # 評価の変更前の値をフィルムから引く
    filv.update(
      strength: filv.strength - self.e_rating_before_last_save.to_i,
      intelligence: filv.intelligence - self.l_rating_before_last_save.to_i,
      charisma: filv.charisma - self.c_rating_before_last_save.to_i
    )
  
    # 評価の変更後の値をフィルムに加える
    filv.update(
      strength: filv.strength + self.e_rating.to_i,
      intelligence: filv.intelligence + self.l_rating.to_i,
      charisma: filv.charisma + self.c_rating.to_i
    )
  end

end

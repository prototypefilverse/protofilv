class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :reviewer
  has_one :filv
       
  after_create :create_reviewer
  after_create :create_filv

  def create_reviewer
    Reviewer.create(user_id: self.id)
  end
  
  def create_filv
    Filv.create(user_id: self.id, reviewer_id: self.reviewer.id)
  end
         
end

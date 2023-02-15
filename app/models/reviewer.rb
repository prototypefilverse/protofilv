class Reviewer < ApplicationRecord

 belongs_to :user
 has_one :filv
 has_many :reviews
 
end

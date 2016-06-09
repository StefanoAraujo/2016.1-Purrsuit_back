class Level < ActiveRecord::Base

  has_many :users
  
  validates :level_number, presence: true
  validates :xp_min, presence: true
  validates :xp_max, presence: true
  validates :level_description, presence: true

end

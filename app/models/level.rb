class Level < ActiveRecord::Base

  has_many :users

  validates :level_number, presence: true
  validates :xp_min, presence: true
  validates :xp_max, presence: true
  validates :level_description, presence: true

# :nocov:
  def self.parse_levels

    levels = [[0, 100, "Level 1", 1], [101, 299, "Level 2", 2], [300, 400, "Level 3", 3]]

    levels.each do |level|
      new_level = Level.new(:xp_min => level[0], :xp_max => level[1], :level_description => level[2], :level_number => level[3])
      if new_level.save
        puts "Adicionado " + level[2]
      end
    end
  end
# :nocov:
end

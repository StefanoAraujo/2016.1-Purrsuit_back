class Level < ActiveRecord::Base

  has_many :users

  validates :level_number, presence: true
  validates :xp_min, presence: true
  validates :xp_max, presence: true
  validates :level_description, presence: true

# :nocov:
  def self.parse_levels

    levels = [[0, 100, "Level 1", 1, "https://www.petfinder.com/wp-content/uploads/2012/11/152177319-declawing-cats-632x475-e1354303246526-632x353.jpg"],
    [101, 299, "Level 2", 2], "http://www.momswhothink.com/images/stories/baby-names/female-cat-names.jpg",
    [300, 400, "Level 3", 3, "https://images-na.ssl-images-amazon.com/images/G/01/img15/pet-products/small-tiles/30423_pets-products_january-site-flip_3-cathealth_short-tile_592x304._CB286975940_.jpg"]]

    levels.each do |level|
      new_level = Level.new(:xp_min => level[0], :xp_max => level[1], :level_description => level[2],
      :level_number => level[3], :image_url => level[4])
      if new_level.save
        puts "Adicionado " + level[2]
      end
    end
  end
# :nocov:
end

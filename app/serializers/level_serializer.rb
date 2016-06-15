class LevelSerializer < ActiveModel::Serializer
  attributes :id, :level_number, :xp_min, :xp_max, :level_description, :image_url
end

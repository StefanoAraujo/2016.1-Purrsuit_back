class AchievementSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :experience_points
end

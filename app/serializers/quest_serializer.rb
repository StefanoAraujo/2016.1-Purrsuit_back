class QuestSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :experience_points
end

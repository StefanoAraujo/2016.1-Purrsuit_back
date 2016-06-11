class UserSerializer < ActiveModel::Serializer
  attributes :id,:email,:nickname,:age,:gender, :experience_points, :uf_id, :level

  def level
  LevelSerializer.new(object.level).attributes
  end
end

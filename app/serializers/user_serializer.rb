class UserSerializer < ActiveModel::Serializer
  attributes :id,:email,:name, :nickname,:age,:gender, :experience_points, :uf_id, :level, :last_acess
end

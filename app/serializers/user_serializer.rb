class UserSerializer < ActiveModel::Serializer
  attributes :id,:email,:nickname,:age,:gender, :experience_points, :uf_id 
end

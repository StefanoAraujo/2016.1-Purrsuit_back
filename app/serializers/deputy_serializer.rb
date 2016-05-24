class DeputySerializer < ActiveModel::Serializer
  attributes :id, :name, :deputy_name, :email, :gender, :age, :registration, :legislation_situation, :uf_id, :party_id, :image_path
end

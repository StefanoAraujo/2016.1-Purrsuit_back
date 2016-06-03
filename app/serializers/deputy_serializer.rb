class DeputySerializer < ActiveModel::Serializer
  attributes :id, :name, :deputy_name, :email, :gender, :age, :registration,
  :legislation_situation, :uf, :party, :image_path, :followers_count

	private
	def uf
	UfSerializer.new(object.uf).attributes
	end
	def party
		PartySerializer.new(object.party).attributes
	end
end

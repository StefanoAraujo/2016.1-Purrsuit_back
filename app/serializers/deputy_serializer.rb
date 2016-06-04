class DeputySerializer < ActiveModel::Serializer

attributes :id, :name, :gender, :email, :age, :uf_id, :deputy_name, :registration, :legislation_situation,:followers_count, :image_path, :party_id

	private
	def uf
	UfSerializer.new(object.uf).attributes
	end
	def party
		PartySerializer.new(object.party).attributes
	end

end

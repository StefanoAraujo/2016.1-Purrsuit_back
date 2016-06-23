class DeputySerializer < ActiveModel::Serializer

attributes :id, :name, :deputy_name, :image_url, :uf, :party

	private
	def uf
	UfSerializer.new(object.uf).attributes
	end
	def party
		PartySerializer.new(object.party).attributes
	end

end

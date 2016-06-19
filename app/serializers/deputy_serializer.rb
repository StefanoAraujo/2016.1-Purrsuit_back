class DeputySerializer < ActiveModel::Serializer

attributes :id, :name, :deputy_name, :image_path, :uf, :party

	private
	def uf
	UfSerializer.new(object.uf).attributes
	end
	def party
		PartySerializer.new(object.party).attributes
	end

end

class DeputyDetailsSerializer < ActiveModel::Serializer


attributes :id, :name, :gender, :email, :age, :deputy_name, :registration,
:legislation_situation,:followers_count, :image_path, :uf, :party, :total_cost

  	private
  	def uf
      UfSerializer.new(object.uf).attributes
  	end

    def party
  		PartySerializer.new(object.party).attributes
  	end
end

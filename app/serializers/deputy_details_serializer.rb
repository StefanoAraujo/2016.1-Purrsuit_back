class DeputyDetailsSerializer < ActiveModel::Serializer


attributes :id, :name, :gender, :email, :age, :deputy_name, :registration,
:legislation_situation,:followers_count, :image_url, :uf, :party, :total_cost,
:total_office_cost, :total_contract_cost, :total_gas_cost, :total_postal_cost, :total_advertising_cost,
:total_security_cost, :total_air_ticket_cost, :total_phone_cost, :total_alimentation_cost,
 :total_accommodation_cost, :total_vehicle_tenancy_cost, :total_participation_cost

  	private
  	def uf
      UfSerializer.new(object.uf).attributes
  	end

    def party
  		PartySerializer.new(object.party).attributes
  	end
end

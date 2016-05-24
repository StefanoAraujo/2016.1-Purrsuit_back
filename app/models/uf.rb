class Uf < ActiveRecord::Base
	has_many :deputies
	has_many :users

	# validates :name, presence: true, length: { minimum: 4, maximum: 20 }, uniqueness: true
	# validates :initials, presence: true, length: { minimum: 2, maximum: 2 }, uniqueness: true
	# before_save :uppercase_initials
	#
	# def uppercase_initials
	# 	self.initials.upcase!
	# end

	def self.populate_ufs
		states = [["RO", "Rondônia"], ["AC", "Acre"], ["AM", "Amazonas"], ["RR", "Roraima"], ["PA", "Pará"], ["AP", "Amapá"], ["TO", "Tocantins"], ["MA", "Maranhão"], ["PI", "Piauí"], ["CE", "Ceará"], ["RN", "Rio Grande do Norte"], ["PB", "Paraíba"], ["PE", "Pernambuco"], ["AL", "Alagoas"], ["SE", "Sergipe"], ["BA", "Bahia"], ["MG", "Minas Gerais"], ["ES", "Espirito Santo"], ["RJ", "Rio de Janeiro"], ["SP", "São Paulo"], ["PR", "Paraná"], ["SC", "Santa Catarina"], ["RS", "Rio Grande do Sul"], ["MS", "Mato Grosso do Sul"], ["MT", "Mato Grosso"], ["GO", "Goiás"], ["DF", "Distrito Federal"]]

		if Uf.all.length > 1
			puts "Base de estados já populado!"
		else
			states.each do |state|
				new_state = Uf.new(:name => state[1], :initials => state[0])
				if new_state.save
					puts "Adicionado " + state[0] + ": " + state[1]
				end
			end
		end
	end

	def add_deputy deputy
			self.deputies << deputy
	end
end

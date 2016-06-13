class Party < ActiveRecord::Base
	has_many :deputies

	validates :name, presence: true, length: { minimum: 10 }, uniqueness: true
	validates :initials, presence: true, length: { minimum: 2 }, uniqueness: true
	# validates :uf_id , presence: true

	def add_deputy deputy
		self.deputies << deputy
	end
# :nocov:
	def self.parse_parties
    response = Parser.request_xml("http://www.camara.leg.br/SitCamaraWS/Deputados.asmx/ObterPartidosCD")
    xml_doc = Parser.get_xml response, 'PARTIDOS', 'xml/parties.xml'
		Party.save_parties xml_doc
	end

	def self.save_parties xml_doc
    xml_doc.xpath("//partido").each do |party|
      initials = party.elements[1].text.to_s
      name = party.elements[2].text.to_s
      #creation_date = party.elements[3].text.to_s
      extinction_date = party.elements[4].text.to_s

			if extinction_date.length <= 5
				party = Party.new(:name => name, :initials => initials)
				if party.save
	        puts "Partido " + initials + " - " + name + " salvo."
	      end
			end
    end
  end
# :nocov:
end

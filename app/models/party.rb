class Party < ActiveRecord::Base
	has_many :deputies

	validates :name, presence: true, length: { minimum: 10 }, uniqueness: true
	validates :initials, presence: true, length: { minimum: 2 }, uniqueness: true
	# validates :uf_id , presence: true

	def add_deputy deputy
		self.deputies << deputy
	end

	def self.parse_parties
    url = URI.parse("http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterPartidosCD")
    request = Net::HTTP::Get.new(url.to_s)
    response = Net::HTTP.start(url.host, url.port) {|http|
      http.request(request)
    }
		if response.kind_of? Net::HTTPSuccess
      xml_doc = Nokogiri::XML(response.body)
      puts "Alimentando base de dados dos PARTIDOS a partir do webservice..."
    else
      xml_doc = Nokogiri::XML(File.open("xml/parties.xml"))
      puts "WebService dos PARTIDOS inacessível."
      puts "Alimentado base de dados dos PARTIDOS a partir de backup..."
    end

    xml_doc.xpath("//partido").each do |party|
      initials = party.elements[1].text.to_s
      name = party.elements[2].text.to_s
      creation_date = party.elements[3].text.to_s
      extinction_date = party.elements[4].text.to_s

			if extinction_date.length <= 5
				party = Party.new(:name => name, :initials => initials)
				if party.save
	        puts "Partido " + initials + " - " + name + " salvo."
	      end
			end
    end
  end

	def self.save_xml
		url = URI.parse("http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterPartidosCD")
    request = Net::HTTP::Get.new(url.to_s)
    response = Net::HTTP.start(url.host, url.port) {|http|
      http.request(request)
    }
    xml_doc = Nokogiri::XML(response.body)
		  File.open('xml/parties.xml', 'w') {|f| f.write xml_doc}
	end

end

require "net/http"
require "uri"
require "nokogiri"

class Deputy < ActiveRecord::Base
  acts_as :person
  belongs_to :uf

  # validates_numericality_of :age
  # validates_numericality_of :registration

  # validates :name, presence: true, length: {maximum: 50}
  # validates :age, presence: true
  # validates :gender, presence: true
  # validates :registration, presence: true, uniqueness: true
  # validates :legislation_situation, presence: true, length: {maximum: 100}


  def self.parse_deputies
    Uf.populate_ufs
    Party.parse_parties

    url = URI.parse("http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados")
    request = Net::HTTP::Get.new(url.to_s)
    response = Net::HTTP.start(url.host, url.port) {|http|
      http.request(request)
    }

    if response.kind_of? Net::HTTPSuccess
      xml_doc = Nokogiri::XML(response.body)
      puts "Alimentando base de dados dos DEPUTADOS a partir do webservice..."
    else
      xml_doc = Nokogiri::XML(File.open("xml/deputies.xml"))
      puts "WebService dos DEPUTADOS inacessível."
      puts "Alimentado base de dados dos DEPUTADOS a partir de backup..."
    end

    xml_doc.xpath("//deputado").each do |d|
      ideCadastro = d.elements[0].text.to_s
      condicao = d.elements[2].text.to_s
      matricula = d.elements[3].text.to_s
      idParlamentar = d.elements[4].text.to_s
      nome = d.elements[5].text.to_s
      nomeParlamentar = d.elements[6].text.to_s
      urlFoto = d.elements[7].text.to_s
      sexo = d.elements[8].text.to_s
      uf = d.elements[9].text.to_s
      partido = d.elements[10].text.to_s
      fone = d.elements[13].text.to_s
      email = d.elements[14].text.to_s



      deputy = Deputy.new(
                            :name => nome,
                            :deputy_name => nomeParlamentar,
                            :gender => sexo,
                            :email => email,
                            :image_path => urlFoto,
                            :registration => matricula,
                            :legislation_situation => condicao
                            )
      if deputy.save
        Uf.find_by_initials(uf).add_deputy(deputy)
        Party.find_by_initials(partido).add_deputy(deputy)
        puts "Deputado " + nomeParlamentar + " salvo."
      end
    end
  end

  def self.save_xml
    url = URI.parse("http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados")
    request = Net::HTTP::Get.new(url.to_s)
    response = Net::HTTP.start(url.host, url.port) {|http|
      http.request(request)
    }
    xml_doc = Nokogiri::XML(response.body)

    File.open('xml/deputies.xml', 'w') {|f| f.write xml_doc}
  end
end

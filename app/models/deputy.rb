class Deputy < ActiveRecord::Base
  acts_as :person
  belongs_to :uf
	belongs_to :party

  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy

  has_many :followers, through: :passive_relationships, source: :follower

  validates_numericality_of :followers_count
  validates_numericality_of :registration
  validates :name, presence: true, length: {maximum: 50}
  validates :deputy_name, presence: true
  # validates :age, presence: true
  # validates :gender, presence: true
  validates :registration, presence: true, uniqueness: true
  validates :legislation_situation, presence: true, length: {maximum: 100}
  validates :email, presence:true

# :nocov:
  def self.parse_deputies
    response = Parser.request_xml("http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados")
    xml_doc = Parser.get_xml response, 'DEPUTADOS', 'xml/deputies.xml'
    Deputy.save_deputies(xml_doc)
  end

  def self.save_deputies xml_doc
    xml_doc.xpath("//deputado").each do |d|
      #ideCadastro = d.elements[0].text.to_s
      condicao = d.elements[2].text.to_s
      matricula = d.elements[3].text.to_s
      #idParlamentar = d.elements[4].text.to_s
      nome = d.elements[5].text.to_s
      nomeParlamentar = d.elements[6].text.to_s
      urlFoto = d.elements[7].text.to_s
      sexo = d.elements[8].text.to_s
      uf = d.elements[9].text.to_s
      partido = d.elements[10].text.to_s
      #fone = d.elements[13].text.to_s
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
# :nocov:
end

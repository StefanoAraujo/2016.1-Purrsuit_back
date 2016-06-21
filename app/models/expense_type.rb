class ExpenseType < ActiveRecord::Base
  belongs_to :spent

  def self.parse_expenses
      xml_doc = Parser.get_xml false, 'DESPESAS', 'xml/expenses.xml'
      ExpenseType.save_expenses(xml_doc)
  end

  def self.save_expenses xml_doc
      xml_doc.xpath("//DESPESA").each do |d|
        nomeParlmanetar = d.elements[0].text.to_s
        matriculaParlamentar = d.elements[2].text.to_s

        despesa = Spent.new(
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

end

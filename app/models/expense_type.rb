class ExpenseType < ActiveRecord::Base
  belongs_to :spent

  def self.parse_expenses
      Parser.download_zip "http://www.camara.gov.br/cotas/AnoAtual.zip"
      Parser.extract_zip 'xml/AnoAtual.zip'
      xml_doc = Parser.get_xml false, 'DESPESAS', 'xml/expenses.xml'
      ExpenseType.save_expenses(xml_doc)
      File.delete('xml/expenses.xml')
      File.delete('xml/AnoAtual.zip')
  end

  def self.save_expenses xml_doc
    xml_doc.xpath("//DESPESA").each do |d|
        matriculaParlamentar = d.elements[2].text.to_s.to_i
        deputy = Deputy.find_by_registration(matriculaParlamentar)

        if deputy == nil
            puts matriculaParlamentar
            next
        end

        subquota = d.elements[7].text.to_s
        description = d.elements[8].text.to_s
        provider = d.elements[11].text.to_s
        provider_registration = d.elements[12].text.to_s
        ticket_number = d.elements[13].text.to_s
        issue_date = d.elements[15].text.to_s
        doc_value = d.elements[16].text.to_s.to_f
        net_value = d.elements[18].text.to_s.to_f

        if ExpenseType.where(:ticket_number => ticket_number) != nil
            expense = ExpenseType.new(
                                  :subquota => subquota,
                                  :description => description,
                                  :provider => provider,
                                  :provider_registration => provider_registration,
                                  :ticket_number => ticket_number,
                                  :issue_date => issue_date,
                                  :doc_value => doc_value,
                                  :net_value => net_value
                                  )
            if expense.save
              deputy.spent.add_expense expense
            end
        end
    end
  end

end

# 1 MANUTENÇÃO DE ESCRITÓRIO DE APOIO À ATIVIDADE PARLAMENTAR - OK(4)
# 4 CONSULTORIAS, PESQUISAS E TRABALHOS TÉCNICOS - OK(10)
# 3 COMBUSTÍVEIS E LUBRIFICANTES - OK(8)
# 5 DIVULGAÇÃO DA ATIVIDADE PARLAMENTAR - OK(11)
# 8 SERIÇO DE SEGURANÇA PRESTADO POR EMPRESA ESPECIALIZADA - OK(9)
# 9 PASSAGENS AÉREAS - OK(1)
# 10 TELEFONIA - OK(2)
# 11 SERVIÇOS POSTAIS - OK(3)
# 12 ASSINATURA DE PUBLICAÇÕES - OK(4)
# 13 FORNECIMENTO DE ALIMENTAÇÃO DO PARLAMENTAR - OK(5)
# 14 HOSPEDAGEM ,EXCETO DO PARLAMENTAR NO DISTRITO FEDERAL - OK(6)
# 999 Emissão Bilhete Aéreo - OK(1)
# 119 LOCAÇÃO OU FRETAMENTO DE AERONAVES - OK(7)
# 121 LOCAÇÃO OU FRETAMENTO DE EMBARCAÇÕES - OK(7)
# 122 SERVIÇO DE TÁXI, PEDÁGIO E ESTACIONAMENTO - OK(7)
# 123 PASSAGENS TERRESTRES, MARÍTIMAS OU FLUVIAIS - OK(7)
# 120 LOCAÇÃO OU FRETAMENTO DE VEÍCULOS AUTOMOTORES - OK(7)
# 137 PARICIPAÇÃO EM CURSO, PALESTRA OU EVENTO SIMILAR - OK(12)

class Spent < ActiveRecord::Base
  belongs_to :deputy
  has_many :expense_types

#:nocov:
  def add_expense expense
    self.expense_types << expense
  end

  def total_cost_value?
      t_value = 0
      self.expense_types.each do |expense|
        t_value = t_value + expense.doc_value
      end
      return t_value
  end

  def subquota_total array
    t_value = 0
    self.expense_types.each do |expense|
      if expense.subquota.in?(array)
        t_value = t_value + expense.doc_value
      end
    end
    return t_value
  end

  def total_office_cost?
    return subquota_total ['1', '12']
  end

  def total_contract_cost?
    return subquota_total ['4']
  end

  def total_gas_cost?
    return subquota_total ['3']
  end

  def total_advertising_cost?
    return subquota_total ['5']
  end

  def total_security_cost?
    return subquota_total ['8']
  end

  def total_air_ticket?
    return subquota_total ['9', '999']
  end

  def total_phone_cost?
    return subquota_total ['10']
  end

  def total_postal_cost?
    return subquota_total ['11']
  end

  def total_alimentation_cost?
    return subquota_total ['13']
  end

  def total_accommodation_cost?
    return subquota_total ['14']
  end

  def total_vehicle_tenancy?
    return subquota_total ['119', '120', '121', '122', '123']
  end

  def total_participation_cost?
    return subquota_total ['137']
  end

#:nocov:

end

# 1 MANUTENÇÃO DE ESCRITÓRIO DE APOIO À ATIVIDADE PARLAMENTAR - OK(4)
# 4 CONSULTORIAS, PESQUISAS E TRABALHOS TÉCNICOS - OK(10)
# 3 COMBUSTÍVEIS E LUBRIFICANTES - OK(8)
# 5 DIVULGAÇÃO DA ATIVIDADE PARLAMENTAR - OK(11)
# 8 SERVIÇO DE SEGURANÇA PRESTADO POR EMPRESA ESPECIALIZADA - OK(9)
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

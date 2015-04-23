require_relative 'enumeration'

module UruguayanExchangeRates
  class Constants < Enumeration
    self.add_item(:DOLLAR, 'Dólar')
    self.add_item(:EURO, 'Euro')
    self.add_item(:UI, 'Unidad Indexada')
  end
end
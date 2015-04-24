require_relative 'enumeration'

module UruguayanExchangeRates
  class Constants < Enumeration
    self.add_item(:UYU_USD, 'Dólar')
    self.add_item(:UYU_EUR, 'Euro')
    self.add_item(:UYU_ARS, 'Peso Argentino')
    self.add_item(:UYU_BRL, 'Real')
    self.add_item(:USD_GPD, 'Dólares USA Por Libra Esterlina')
    self.add_item(:CHF_USD, 'Francos Suizos Por Dólar')
    self.add_item(:JPY_USD, 'Yens Por Dólar')
    self.add_item(:USD_EUR, 'Dólares USA Por Euro')
    self.add_item(:ARS_USD, 'Pesos Argentinos Por Dólar')
    self.add_item(:BRL_USD, 'Reales Por Dólar')
    self.add_item(:PYG_USD, 'Guaraníes Por Dólar')
    self.add_item(:UYU_UI, 'Unidad Indexada')
    self.add_item(:USD_ONZATROY, 'Onza Troy De Oro')
  end
end

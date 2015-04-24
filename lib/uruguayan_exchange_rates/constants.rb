# encoding: utf-8
require_relative 'enumeration'

module UruguayanExchangeRates
  class Constants < Enumeration
    self.add_item(:UYU_USD, 'Dólar')
    self.add_item(:UYU_EUR, 'Euro')
    self.add_item(:UYU_ARS, 'Peso Argentino')
    self.add_item(:UYU_BRL, 'Real')
    self.add_item(:USD_GPD, 'Dólares USA por Libra esterlina')
    self.add_item(:CHF_USD, 'Francos suizos por Dólar')
    self.add_item(:JPY_USD, 'Yens por Dólar')
    self.add_item(:USD_EUR, 'Dólares USA por Euro')
    self.add_item(:ARS_USD, 'Pesos Argentinos por Dólar')
    self.add_item(:BRL_USD, 'Reales por Dólar')
    self.add_item(:PYG_USD, 'Guaraníes por Dólar')
    self.add_item(:UYU_UI, 'Unidad Indexada')
    self.add_item(:USD_ONZATROY, 'Onza Troy de Oro')
  end
end

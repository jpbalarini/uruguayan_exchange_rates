require 'uruguayan_exchange_rates/version'
require 'uruguayan_exchange_rates/constants'
require 'net/http'
require 'nokogiri'

# TODO: remove nokogiri and add a regular expression

module UruguayanExchangeRates
  SERVICE_HOST = 'http://www.bancorepublica.com.uy'
  SERVICE_PATH = '/web/guest/institucional/cotizaciones'

  def self.exchange_rates(currency)
    uri = URI.parse(SERVICE_HOST + SERVICE_PATH)
    result = Net::HTTP.get(uri)
    parsed_doc = Nokogiri::HTML(result)
    values = parsed_doc.css('#exchangeRatesLarge').at('tr:contains("' + currency + '")')
    puts '//////////////////'
    puts Constants::DOLLAR
    if values.nil?
      raise 'Currency not found'
    else
      # Remove unnecessary spaces
      values = values.text.strip
      # Remove name
      values.gsub!(currency, '')
      # Remove spaces
      values.gsub!(/(?:\n\r?|\r\n?)/, ' ').strip!
      buy, sell = values.split(/\s+/).map{ |v| v.to_f }
    end
  end
end

require 'uruguayan_exchange_rates/version'
require 'uruguayan_exchange_rates/constants'
require 'uruguayan_exchange_rates/error'
require 'net/http'
require 'nokogiri'

# TODO: remove nokogiri and add a regular expression
# TODO: separate things in different methods

module UruguayanExchangeRates
  SERVICE_HOST = 'http://www.bancorepublica.com.uy'
  SERVICE_PATH = '/web/guest/institucional/cotizaciones'

  def self.exchange_rates(currency)
    raise InvalidCurrency, 'Invalid currency' if Constants[currency].nil?
    # Make request
    uri = URI.parse(SERVICE_HOST + SERVICE_PATH)
    result = Net::HTTP.get(uri)
    parsed_doc = Nokogiri::HTML(result)

    # Find currency in page
    currency_string = Constants[currency]
    values = parsed_doc.css('#exchangeRatesLarge').at('tr:contains("' + currency_string + '")')
    
    raise CurrencyNotFound, 'Currency not found' if values.nil?
    
    # Remove unnecessary spaces
    values = values.text.strip
    # Remove name
    values.gsub!(currency_string, '')
    # Remove spaces
    values.gsub!(/(?:\n\r?|\r\n?)/, ' ').strip!
    buy, sell = values.split(/\s+/).map{ |v| v.to_f }
  end
end

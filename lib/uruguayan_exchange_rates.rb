require 'uruguayan_exchange_rates/version'
require 'uruguayan_exchange_rates/constants'
require 'uruguayan_exchange_rates/error'
require 'uruguayan_exchange_rates/util'

# TODO: remove nokogiri and add a regular expression
# TODO: compare in lowercase
# TODO: add version numbers to gem dependencies
# TODO: pass multiple currencies to lower server requests

module UruguayanExchangeRates
  SERVICE_HOST = 'http://www.bancorepublica.com.uy'
  SERVICE_PATH = '/web/guest/institucional/cotizaciones'

  def self.exchange_rates(currency)
    currency_raw = Constants[currency]
    raise InvalidCurrency, 'Invalid currency' if currency_raw.nil?

    util = Util.new(currency_raw: currency_raw)
    # Make request
    data = util.request_data

    # Find currency in page
    currency_data = util.find_currency(data)

    raise CurrencyNotFound, 'Currency not found' if currency_data.nil?

    # Get values
    util.extract_values(currency_data)
  end
end

require 'net/http'
require 'nokogiri'

module UruguayanExchangeRates 
  class Util
    attr_accessor :currency_raw

    def initialize(options = {})
      unless block_given?
        options.each do |key, value|
          send(:"#{key}=", value)
        end
      else
        yield(self)
      end
    end

    def request_data
      uri = URI.parse(SERVICE_HOST + SERVICE_PATH)
      result = Net::HTTP.get(uri)
      data = Nokogiri::HTML(result)
    end

    def find_currency(data)
      values = data.css('#exchangeRatesLarge').at('tr:contains("' + currency_raw + '")')
    end

    def currency_values(currency_data)
      # Remove unnecessary spaces
      values = currency_data.text.strip
      # Remove name
      values.gsub!(currency_raw, '')
      # Remove spaces
      values.gsub!(/(?:\n\r?|\r\n?)/, ' ').strip!
      buy, sell = values.split(/\s+/).map{ |v| v.to_f }
    end
  end
end
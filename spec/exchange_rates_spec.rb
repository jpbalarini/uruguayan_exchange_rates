require 'spec_helper'
require 'uruguayan_exchange_rates'

describe UruguayanExchangeRates do
  context 'with valid params' do
    it 'should return 2 parameters' do
      UruguayanExchangeRates::Constants.keys.each do |key|
        expect(UruguayanExchangeRates::exchange_rates(key).count).to eq(2)
      end
    end
  end

  context 'with invalid params' do
    it 'should return 2 parameters' do
      UruguayanExchangeRates::Constants.keys.each do |key|
        expect(UruguayanExchangeRates::exchange_rates(key).count).to eq(2)
      end
    end
  end
end

require 'spec_helper'
require 'uruguayan_exchange_rates'

describe UruguayanExchangeRates do
  context 'with valid params' do
    it 'should return 2 parameters' do
      UruguayanExchangeRates::Constants.keys.each do |key|
        expect(UruguayanExchangeRates::exchange_rates(key)[0]).to be > 0.0
        expect(UruguayanExchangeRates::exchange_rates(key)[1]).to be > 0.0
        expect(UruguayanExchangeRates::exchange_rates(key).count).to eq(2)
      end
    end
  end

  context 'with invalid params' do
    it 'should return InvalidCurrency' do
      expect{ 
        UruguayanExchangeRates::exchange_rates('foo')
      }.to raise_error(UruguayanExchangeRates::InvalidCurrency)
      expect{ 
        UruguayanExchangeRates::exchange_rates(2)
      }.to raise_error(UruguayanExchangeRates::InvalidCurrency)
      expect{ 
        UruguayanExchangeRates::exchange_rates(:FOO_BAR)
      }.to raise_error(UruguayanExchangeRates::InvalidCurrency)
    end

    it 'should return CurrencyNotFound' do
      # Add test element to Constants
      UruguayanExchangeRates::Constants.add_item(:FOO_BAR, 'Foo_bar')
      expect{
        UruguayanExchangeRates::exchange_rates(:FOO_BAR)
      }.to raise_error(UruguayanExchangeRates::CurrencyNotFound)
    end
  end

  context 'with bad URI' do
    it 'should return an error' do
      # Change host
      stub_const('UruguayanExchangeRates::SERVICE_HOST', 'SOME_BAD_HOST')
      # Get some currency
      currency = UruguayanExchangeRates::Constants.keys.first
      expect{
        UruguayanExchangeRates::exchange_rates(currency)
      }.to raise_error
    end
  end
end

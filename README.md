# Uruguayan Exchange Rates

[![Code Climate](https://codeclimate.com/github/jpbalarini/uruguayan_exchange_rates/badges/gpa.svg)](https://codeclimate.com/github/jpbalarini/uruguayan_exchange_rates)
[![Build Status](https://travis-ci.org/jpbalarini/uruguayan_exchange_rates.svg?branch=master)](https://travis-ci.org/jpbalarini/uruguayan_exchange_rates)

With this gem you can get the official Uruguayan exchange rates (buy and sell) for multiple currencies. Data is taken from Banco República.
This gem was designed for a project where I needed to update the price of some elements daily, using the official Uruguayan exchange rates.

## Installation

Add this line to your application's Gemfile:

    gem 'uruguayan_exchange_rates'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uruguayan_exchange_rates

## Usage

Usage is simple, just call the exchange_rates method with a valid key:
  
    UruguayanExchangeRates.exchange_rates(:UYU_USD)

This should return an array with two elements, buy and sell values:
  
    [25.95, 26.75]

Supported keys are:
  
    {
      :UYU_USD => 'Dólar',
      :UYU_EUR => 'Euro',
      :UYU_ARS => 'Peso Argentino',
      :UYU_BRL => 'Real',
      :USD_GPD => 'Dólares USA por Libra esterlina',
      :CHF_USD => 'Francos suizos por Dólar',
      :JPY_USD => 'Yens por Dólar',
      :USD_EUR => 'Dólares USA por Euro',
      :ARS_USD => 'Pesos Argentinos por Dólar',
      :BRL_USD => 'Reales por Dólar',
      :PYG_USD => 'Guaraníes por Dólar',
      :UYU_UI => 'Unidad Indexada',
      :USD_ONZATROY => 'Onza Troy de Oro'
    }

## Contributing

1. Fork it ( https://github.com/jpbalarini/uruguayan_exchange_rates/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

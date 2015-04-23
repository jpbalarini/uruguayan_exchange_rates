# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uruguayan_exchange_rates/version'

Gem::Specification.new do |spec|
  spec.name          = "uruguayan_exchange_rates"
  spec.version       = UruguayanExchangeRates::VERSION
  spec.authors       = ["Juan Pablo Balarini"]
  spec.email         = ["jpbalarini@gmail.com"]
  spec.summary       = %q{Uruguayan exchange rates.}
  spec.description   = %q{Uruguayan exchange rates. Data is taken from the Banco Republica.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
end

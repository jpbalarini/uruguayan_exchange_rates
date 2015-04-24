module UruguayanExchangeRates
  # Custom error class for rescuing from all UruguayanExchangeRates errors
  class Error < StandardError; end

  # Raised when invalid currency is passed
  class InvalidCurrency < Error; end

  # Raised when currency is not found on the page
  class CurrencyNotFound < Error; end
end
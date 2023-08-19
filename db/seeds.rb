# frozen_string_literal: true

service = CurrencyRatesService.new
30.times do |i|
  rates = service.fetch_rates_for(Date.today - i.days)
  Rate.create(date: Date.today - i.days, usd: rates[:usd], eur: rates[:eur])
end

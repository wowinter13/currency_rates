# frozen_string_literal: true

require 'httparty'

class CurrencyRatesService
  API_URL = 'https://www.cbr.ru/scripts/XML_daily.asp?date_req='

  def fetch_rates_for(date)
    response = HTTParty.get("#{API_URL}#{date.strftime('%d/%m/%Y')}")
    doc = Nokogiri::XML(response.body)
    {
      usd: doc.xpath("//Valute[@ID='R01235']/Value").text.tr(',', '.').to_f,
      eur: doc.xpath("//Valute[@ID='R01239']/Value").text.tr(',', '.').to_f
    }
  end
end

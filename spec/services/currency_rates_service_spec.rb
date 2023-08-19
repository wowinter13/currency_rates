# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CurrencyRatesService do
  describe '#fetch_rates_for' do
    let(:service) { CurrencyRatesService.new }
    let(:date) { Date.new(2023, 9, 2) }
    let(:stubbed_response) do
      <<~XML
        <?xml version="1.0" encoding="UTF-8"?>
        <ValCurs Date="02.09.2023" name="Foreign Currency Market">
          <Valute ID="R01235">
            <NumCode>840</NumCode>
            <CharCode>USD</CharCode>
            <Nominal>1</Nominal>
            <Name>US Dollar</Name>
            <Value>75,50</Value>
          </Valute>
          <Valute ID="R01239">
            <NumCode>978</NumCode>
            <CharCode>EUR</CharCode>
            <Nominal>1</Nominal>
            <Name>Euro</Name>
            <Value>85,20</Value>
          </Valute>
        </ValCurs>
      XML
    end

    before do
      stub_request(:get, "#{CurrencyRatesService::API_URL}#{date.strftime('%d/%m/%Y')}")
        .to_return(body: stubbed_response)
    end

    it 'returns correct USD and EUR rates for the specified date' do
      rates = service.fetch_rates_for(date)
      expect(rates[:usd]).to eq(75.50)
      expect(rates[:eur]).to eq(85.20)
    end
  end
end

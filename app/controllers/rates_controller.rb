# frozen_string_literal: true

class RatesController < ApplicationController
  def index
    rates = Rate.order(:date).last(30)

    @data = rates.map do |rate|
      {
        date: rate.date.to_s,
        usd: rate.usd,
        eur: rate.eur
      }
    end
  end
end

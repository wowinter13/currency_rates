# frozen_string_literal: true

# spec/models/rate_spec.rb

require 'rails_helper'

RSpec.describe Rate, type: :model do
  it 'is valid with a date, USD rate, and EUR rate' do
    rate = Rate.new(date: Date.today, usd: 75.5, eur: 85.2)
    expect(rate).to be_valid
  end
end

# frozen_string_literal: true

# spec/factories/rates.rb

FactoryBot.define do
  factory :rate do
    date { Date.today }
    usd { Faker::Number.decimal(l_digits: 2, r_digits: 2) }  # Random float value for USD rate
    eur { Faker::Number.decimal(l_digits: 2, r_digits: 2) }  # Random float value for EUR rate
  end
end

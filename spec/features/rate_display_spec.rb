# frozen_string_literal: true

# spec/features/rate_display_spec.rb

require 'rails_helper'

RSpec.feature 'RateDisplay', type: :feature do
  scenario 'User visits rates page' do
    visit rates_path

    expect(page).to have_css('#chart')
  end
end

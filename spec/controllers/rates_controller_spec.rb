# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RatesController, type: :controller do
  describe 'GET #index' do
    it 'assigns the last 30 rates to @data' do
      FactoryBot.create_list(:rate, 35)
      get :index
      expect(assigns(:data).length).to eq(30)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end

# frozen_string_literal: true

class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.date :date
      t.decimal :usd, precision: 10, scale: 2, null: false
      t.decimal :eur, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end

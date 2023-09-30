# frozen_string_literal: true

class CreateNaicsCode < ActiveRecord::Migration[5.2]
  def change
    create_table :naics_codes do |t|
      t.string :code, null: false, default: ''
      t.string :title, null: false, default: ''
      t.text :description

      t.timestamps
    end
  end
end

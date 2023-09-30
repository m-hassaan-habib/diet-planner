# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false, default: ''
      t.text :avatar_url
      t.string :business_structure
      t.string :duns_number
      t.references :naics_code
      t.index ['name'], name: 'index_companies_on_name'

      t.timestamps
    end
  end
end

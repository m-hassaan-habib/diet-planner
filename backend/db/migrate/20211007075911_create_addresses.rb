# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_type, null: false, default: ''
      t.string :street_address, null: false, default: ''
      t.string :city, null: false, default: ''
      t.string :state, null: false, default: ''
      t.string :postal_code, null: false, default: ''
      t.references :company

      t.timestamps
    end
  end
end

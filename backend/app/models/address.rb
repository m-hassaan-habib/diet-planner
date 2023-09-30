# frozen_string_literal: true

class Address < ApplicationRecord
  TYPE = {
    primary: 'primary',
    secondary: 'secondary'
  }.freeze

  enum address_type: TYPE

  belongs_to :company, optional: true

  validates :street_address, :city, :state, :postal_code, presence: true
end

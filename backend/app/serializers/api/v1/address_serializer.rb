# frozen_string_literal: true

class Api::V1::AddressSerializer < ActiveModel::Serializer
  type 'addresses'

  attributes :id, :address_type, :street_address, :city, :state, :postal_code, :complete_address

  def id
    object[:id]
  end

  def address_type
    object[:address_type]
  end

  def street_address
    object[:street_address]
  end

  def city
    object[:city]
  end

  def state
    object[:state]
  end

  def postal_code
    object[:postal_code]
  end

  def complete_address
    state_address = [state, postal_code].compact.join(' ')

    [
      street_address,
      city,
      state_address
    ].compact.delete_if(&:blank?).join(', ')
  end
end

# frozen_string_literal: true

class Api::V1::CompanySerializer < ActiveModel::Serializer
  type 'companies'

  attributes :id, :name, :primary_address, :avatar_url, :business_structure, :duns_number,
             :created_at, :updated_at, :naics_code

  def id
    object[:id]
  end

  def name
    object[:name]
  end

  def primary_address
    Api::V1::AddressSerializer.new(object.primary_address, scope: scope) if object.primary_address.present?
  end

  def avatar_url
    object[:avatar_url]
  end

  def business_structure
    object[:business_structure]
  end

  def duns_number
    object[:duns_number]
  end

  def naics_code
    Api::V1::NaicsCodeSerializer.new(object.naics_code, scope: scope) if object.naics_code.present?
  end

  def created_at
    object[:created_at]
  end

  def updated_at
    object[:updated_at]
  end
end

# frozen_string_literal: true

class Api::V1::NaicsCodeSerializer < ActiveModel::Serializer
  type 'naics_code'

  attributes :id, :code, :title, :description

  def id
    object[:id]
  end

  def code
    object[:code]
  end

  def title
    object[:title]
  end

  def description
    object[:description]
  end
end

# frozen_string_literal: true

class Api::V1::CompaniesController < ApplicationController
  def index
    companies = Company.search_for_index(params)
    result = ActiveModelSerializers::SerializableResource.new(
              companies, each_serializer: Api::V1::CompanySerializer
             ).serializable_hash
    pagy = Pagy.new_from_searchkick(companies)

    render json: { data: result, pagy: pagy_metadata(pagy) }
  end
end

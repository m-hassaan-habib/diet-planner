# frozen_string_literal: true

module CompanySearch
  extend ActiveSupport::Concern

  included do
    FIELDS = %i[id name code_id cities business_structure].freeze
    FILTERS = %i[code_id business_structure cities].freeze

    searchkick word_middle: FIELDS

    def self.search_for_index(params = {})
      search_params = default_search_options(params)

      search_params[:order] = order_hash(params, search_params[:order])
      search_params[:where] = where_hash(params, search_params[:where])

      elastic_search(params.dig(:search, :company_name), search_params)
    end

    def self.default_search_options(params)
      {
        fields: FIELDS,
        match: :word_middle,
        load: false,
        misspellings: false,
        per_page: Company::PER_PAGE,
        page: params[:page],
      }
    end
  end

  def search_data
    dupped_attributes = attributes.dup

    relational = {
      primary_address: addresses&.primary&.first,
      cities: addresses.primary.map(&:city),
      naics_code: naics_code,
      code_id: naics_code&.code
    }
    dupped_attributes.merge! relational
  end
end

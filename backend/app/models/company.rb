# frozen_string_literal: true

class Company < ApplicationRecord
  include ElasticSearchConcern
  include CompanySearch

  PER_PAGE = 10

  has_many :addresses, dependent: :destroy

  belongs_to :naics_code, optional: :true

  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
end

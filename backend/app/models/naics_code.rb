# frozen_string_literal: true

class NaicsCode < ApplicationRecord
  has_many :companies

  validates :code, :title, presence: true
  validates :code, uniqueness: true
end

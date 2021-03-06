# frozen_string_literal: true

class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  broadcasts_to ->(quote) { 'quotes' }, insert_by: :prepend
end

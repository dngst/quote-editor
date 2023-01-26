# frozen_string_literal: true

# == Schema Information
#
# Table name: quotes
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
class Quote < ApplicationRecord
  belongs_to :company

  has_many :line_item_dates, dependent: :destroy

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  broadcasts_to ->(quote) { [quote.company, 'quotes'] }, inserts_by: :prepend
end

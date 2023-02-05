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
# Indexes
#
#  index_quotes_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class Quote < ApplicationRecord
  belongs_to :company

  has_many :line_item_dates, dependent: :destroy

  has_many :line_items, through: :line_item_dates

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  broadcasts_to ->(quote) { [quote.company, 'quotes'] }, inserts_by: :prepend

  def total_price
    line_items.sum(&:total_price)
  end
end

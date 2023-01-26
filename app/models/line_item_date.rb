# == Schema Information
#
# Table name: line_item_dates
#
#  id         :bigint           not null, primary key
#  quote_id   :bigint           not null
#  date       :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class LineItemDate < ApplicationRecord
  belongs_to :quote

  validates :date, presence: true, uniqueness: { scope: :quote_id }

  scope :ordered, -> { order(date: :asc) }

  def previous_date
    quote.line_item_dates.ordered.where("date < ?", date).last
  end
end

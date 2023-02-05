require 'test_helper'

class LineItemDateTest < ActiveSupport::TestCase
  def setup
    @line_item_date = line_item_dates(:today)
  end

  test 'valid date' do
    @line_item_date.valid?
  end

  test 'invalid date' do
    @line_item_date.date = nil
    assert_not @line_item_date.valid?
    assert_not_nil @line_item_date.errors[:date]
  end

  test "#previous_date returns the quote's previous date when it exists" do
    assert_equal line_item_dates(:today), line_item_dates(:next_week).previous_date
  end

  test '#previous_date returns nil when the quote has no previous date' do
    assert_nil line_item_dates(:today).previous_date
  end
end

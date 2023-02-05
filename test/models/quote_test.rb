require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  def setup
    @quote = quotes(:first)
  end

  test 'valid quote' do
    assert @quote.valid?
  end

  test 'invalid without name' do
    @quote.name = nil
    assert_not @quote.valid?
    assert_not_nil @quote.errors[:name]
  end

  test 'invalid without company' do
    @quote.company = nil
    assert_not @quote.valid?
    assert_not_nil @quote.errors[:company]
  end

  test '#total_price returns the sum of the total price of all line items' do
    assert_equal 2500, quotes(:first).total_price
  end
end

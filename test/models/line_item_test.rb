require "test_helper"

class LineItemTest < ActiveSupport::TestCase
  def setup
    @line_item = line_items(:room_today)
  end

  test "valid line item" do
    @line_item.valid?
  end

  test "invalid line item" do
    @line_item.name = nil
    @line_item.quantity = nil
    @line_item.unit_price = nil
    refute @line_item.valid?
    assert_not_nil @line_item.errors[:name]
    assert_not_nil @line_item.errors[:quantity]
    assert_not_nil @line_item.errors[:unit_price]
  end

  test "responds to quote" do
    assert_respond_to(@line_item, :quote)
  end

  test "#total_price returns the total price of the line item" do
    assert_equal 250, line_items(:catering_today).total_price
  end
end

# frozen_string_literal: true

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = companies(:kpmg)
  end

  test 'valid company' do
    assert @company.valid?
  end

  test 'invalid company without name' do
    @company.name = nil
    assert_not @company.valid?
    assert_not_nil @company.errors[:name]
  end
end

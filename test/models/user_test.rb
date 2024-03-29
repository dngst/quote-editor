# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:accountant)
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without email' do
    @user.email = nil
    assert_not @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test 'invalid without company' do
    @user.company = nil
    assert_not @user.valid?
    assert_not_nil @user.errors[:company]
  end

  test 'name' do
    assert_equal 'Accountant', users(:accountant).name
  end
end

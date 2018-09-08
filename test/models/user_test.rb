require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(email: 'john@example.com', password: 'password')
    assert user.valid?
  end

  test 'invalid without email' do
    user = User.new(password: 'password')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

  test 'invalid without password' do
    user = User.new(email: 'john@example.com')
    refute user.valid?, 'user is valid without a password'
    assert_not_nil user.errors[:name], 'no validation error for name present'
  end

end

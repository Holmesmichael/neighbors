require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
    puts "user model works"
  end
 
  test "First name null" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "Last name null" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "Email null" do
    user = User.new
    assert !user.save
    assert !user.errors[:email].empty?
  end

  test "case sensitive email" do
    user = User.new(email: "Michael.Scott@office.com")
    assert_equal "Michael.Scott@office.com", user.email
  end


end

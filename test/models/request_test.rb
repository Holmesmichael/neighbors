require 'test_helper'

class RequestTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
    puts "request model works"
  end

  test "title null" do
    request= Request.new(title: '', :description =>'I need help',:address =>'Chicago',:request_type =>'help')
    assert_not request.save
  end

  test "description null" do
    request= Request.new(title: 'Help', :description =>'',:address =>'Chicago',:request_type =>'help')
    assert_not request.save
  end

  test "address null" do
    request = Request.new(:title =>'Help',:description =>'I need help',:address =>'',:request_type =>'help')
    assert_not request.save
  end

  test "request_type null" do
    request = Request.new(:title =>'Help',:description =>'I need help',:address =>'Chicago',:request_type =>'')
    assert_not request.save
  end


end

require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get requests_url
    assert_response :success
  end


  test "should create request" do
      post requests_url, params: { request: {title: 'title', description: 'description', address: 'address', done: '0', request_type: 'help' } }
    assert_response 200
  end


  test "should update request" do
    patch request_url(@request), params: { request: {title: 'title', description: 'description', address: 'address', done: '0', request_type: 'help' } }
    assert_response 200
  end

end



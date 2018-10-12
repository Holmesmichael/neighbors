require 'test_helper'

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conversation = conversation(:one)
  end

  test "should get index" do
    get conversation_url
    assert_response :success
  end

  test "should get new" do
    get new_conversation_url
    assert_response :success
  end

  test "should create conversation" do
    assert_difference('Conversation.count') do
      post conversation_url, params: { conversation: {  } }
    end

    assert_response 200
  end

  test "should show conversation" do
    get conversation_url(@conversation)
    assert_response :success
  end

  test "should get edit" do
    get edit_conversation_url(@conversation)
    assert_response :success
  end

  test "should update conversation" do
    patch conversation_url(@conversation), params: { conversation: {  } }
    assert_redirected_to conversation_url(@conversation)
  end


end

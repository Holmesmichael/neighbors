class ConversationsController < ApplicationController
  before_action :authenticate_user!

  

  def index
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @requests = Request.all
    @users = User.all - [current_user]
  end

  def create
    sender_id = current_user.id

    if Conversation.between(params[:sender_id],params[:request_id]).present?
      @conversation = Conversation.between(params[:sender_id],  params[:request_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private
    def conversation_params
      params.permit(:sender_id, :receiver_id,:request_id)
    end

    def unread_message_count(current_user)
      self.messages.where("user_id != ? AND read = ?", current_user.id, false).count
    end
    
end


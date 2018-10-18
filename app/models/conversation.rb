class Conversation < ApplicationRecord
    belongs_to :sender, class_name: "User", foreign_key: "sender_id"
    belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
    has_many :messages, dependent: :destroy
    belongs_to :request, class_name: "Request", foreign_key: "request_id"
    belongs_to :request, counter_cache: true

    validates_uniqueness_of :sender_id, :scope => :receiver_id, :scope => :request_id
    scope :between, ->(sender_id, request_id) {where(sender_id: sender_id, request_id: request_id)}
    
    def unread_message_count(current_user)
        self.messages.where("user_id != ? AND read = ?", current_user.id, false).count
    end

  end
  
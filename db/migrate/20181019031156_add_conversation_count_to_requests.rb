class AddConversationCountToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :conversations_count, :integer, default: 0
  end
end

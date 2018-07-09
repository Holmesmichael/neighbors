class AddIdToUsers < ActiveRecord::Migration[5.1]
  def up
    add_attachment :users, :ID
  end
 
  def down
    remove_attachment :users, :ID
  end
end

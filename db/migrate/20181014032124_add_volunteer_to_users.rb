class AddVolunteerToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :volunteer, :string
  end
end

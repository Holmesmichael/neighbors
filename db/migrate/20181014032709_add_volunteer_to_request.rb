class AddVolunteerToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :volunteer, :string
  end
end

class RemoveLatFromRequests < ActiveRecord::Migration[5.1]
  def change
    remove_column :requests, :lat, :float
    remove_column :requests, :lng, :float
  end
end

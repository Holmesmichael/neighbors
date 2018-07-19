class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.float :lat
      t.float :lng
      t.string :address
      t.integer :done, default: 0
      t.integer :counter, default: 0
      t.string :request_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

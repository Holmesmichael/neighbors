class CreateVolunteers < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteers do |t|
      t.references :user, foreign_key: true
      t.references :request, foreign_key: true
      t.integer :done

      t.timestamps
    end
  end
end

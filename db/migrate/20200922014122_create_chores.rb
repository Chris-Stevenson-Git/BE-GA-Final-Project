class CreateChores < ActiveRecord::Migration[5.2]
  def change
    create_table :chores do |t|
      t.text :name
      t.text :location
      t.integer :est_time
      t.string :user_id
      t.string :household_id

      t.timestamps
    end
  end
end

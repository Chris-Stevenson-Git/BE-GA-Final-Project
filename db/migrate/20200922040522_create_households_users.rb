class CreateHouseholdsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :households_users do |t|
      t.belongs_to :household
      t.belongs_to :user
    end
  end
end

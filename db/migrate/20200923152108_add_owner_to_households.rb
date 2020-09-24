class AddOwnerToHouseholds < ActiveRecord::Migration[5.2]
  def change
    add_column :households, :owner, :integer
  end
end

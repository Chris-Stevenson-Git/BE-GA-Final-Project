class AddCompletedToChores < ActiveRecord::Migration[5.2]
  def change
    add_column :chores, :completed, :boolean
  end
end

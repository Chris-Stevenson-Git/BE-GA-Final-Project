class AddFrequencyToChores < ActiveRecord::Migration[5.2]
  def change
    add_column :chores, :frequency, :integer
  end
end

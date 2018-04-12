class AddZenIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :zen_id, :integer, limit: 8
  end
 
end

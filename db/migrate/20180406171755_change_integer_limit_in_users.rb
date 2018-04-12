class ChangeIntegerLimitInUsers < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :zendesk_id, :integer, limit: 8
    change_column :users, :zendesk_id_int, :integer, limit: 8
  end
end

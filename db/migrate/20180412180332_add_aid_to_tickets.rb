class AddAidToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :a_id, :integer, limit: 8
  end
 
end

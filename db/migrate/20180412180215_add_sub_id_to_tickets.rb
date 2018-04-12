class AddSubIdToTickets < ActiveRecord::Migration[5.1]
 def change
    add_column :tickets, :sub_id, :integer, limit: 8
  end
end

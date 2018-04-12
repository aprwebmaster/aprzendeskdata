class AddGIdToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :g_id, :integer, limit: 8
  end
end

class AddZenIdToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :zen_id, :integer, limit: 8
  end
end

class AddReqIdToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :req_id, :integer, limit: 8
  end
end

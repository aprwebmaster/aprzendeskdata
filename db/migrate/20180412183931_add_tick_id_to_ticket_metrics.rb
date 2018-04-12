class AddTickIdToTicketMetrics < ActiveRecord::Migration[5.1]
  def change
    add_column :ticket_metrics, :tick_id, :integer, limit: 8
  end
end

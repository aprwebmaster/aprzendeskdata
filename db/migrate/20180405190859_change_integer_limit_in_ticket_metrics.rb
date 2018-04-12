class ChangeIntegerLimitInTicketMetrics < ActiveRecord::Migration[5.1]
  def change
  	 change_column :ticket_metrics, :zendesk_id, :integer, limit: 8
     change_column :ticket_metrics, :ticket_id, :integer, limit: 8
  end
end

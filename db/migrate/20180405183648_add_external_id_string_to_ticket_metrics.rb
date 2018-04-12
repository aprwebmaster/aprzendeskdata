class AddExternalIdStringToTicketMetrics < ActiveRecord::Migration[5.1]
  def change
  	    add_column :ticket_metrics, :external_id_string, :string
  end
end

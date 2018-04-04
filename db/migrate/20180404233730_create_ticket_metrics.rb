class CreateTicketMetrics < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_metrics do |t|
      t.integer :zendesk_id
      t.integer :ticket_id
      t.date :assignee_updated_at
      t.date :initially_assigned_at
      t.date :solved_at
      t.string :first_resolution_time_in_minutes
      t.string :reply_time_in_minutes
      t.string :full_resolution_time_in_minutes
      t.date :created_at
      t.date :updated_at

      t.timestamps
    end
  end
end

class ChangeIntegerLimitInTickets < ActiveRecord::Migration[5.1]
  def change
     change_column :tickets, :zendesk_id, :integer, limit: 8
     change_column :tickets, :requester_id, :integer, limit: 8
     change_column :tickets, :submitter_id, :integer, limit: 8
     change_column :tickets, :assignee_id, :integer, limit: 8
     change_column :tickets, :group_id, :integer, limit: 8
  end
end

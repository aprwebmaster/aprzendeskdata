class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.integer :zendesk_id
      t.integer :external_id
      t.string :subject
      t.string :description
      t.string :status
      t.string :recipient
      t.integer :requester_id
      t.integer :submitter_id
      t.integer :assignee_id
      t.integer :group_id
      t.text :tags
      t.string :satisfaction_rating
      t.date :created_at
      t.date :updated_at

      t.timestamps
    end
  end
end

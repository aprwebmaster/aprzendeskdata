class ChangeZendeskIDtoInteger < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :zendesk_id, :integer 
  end
end

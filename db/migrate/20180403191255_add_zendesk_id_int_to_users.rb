class AddZendeskIdIntToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :zendesk_id_int, :integer
  end
end

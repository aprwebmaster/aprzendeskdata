class AddExternalIdStringToTickets < ActiveRecord::Migration[5.1]
  	def change
    add_column :tickets, :external_id_string, :string
    end
end

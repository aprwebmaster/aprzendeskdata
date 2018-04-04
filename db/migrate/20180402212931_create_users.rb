class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :zendesk_id
      t.string :url
      t.string :name
      t.string :email
      t.string :created_at
      t.string :updated_at
      t.string :time_zone
      t.string :phone
      t.string :shared_phone_number
      t.string :photo
      t.string :locale_id
      t.string :locale
      t.string :organization_id
      t.string :role
      t.boolean :verified
      t.string :external_id
      t.string :tags
      t.string :alias
      t.boolean :active
      t.boolean :shared
      t.boolean :shared_agent
      t.string :last_login_at
      t.boolean :two_factor_auth_enabled
      t.string :signature
      t.string :details
      t.string :notes
      t.string :role_type
      t.string :custom_role_id
      t.boolean :moderator
      t.string :ticket_restriction
      t.boolean :only_private_comments
      t.boolean :restricted_agent
      t.boolean :suspended
      t.boolean :chat_only
      t.string :default_group_id
      t.string :user_fields

      t.timestamps
    end
  end
end

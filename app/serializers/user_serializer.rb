class UserSerializer < ActiveModel::Serializer
  attributes :id, :zen_id, :name, :email, :created_at, :updated_at, :time_zone, :phone, :shared_phone_number, :photo, :locale_id, 
  :locale, :organization_id, :role, :verified, :external_id, :tags, :alias, :active, :shared, :shared_agent, :last_login_at, 
  :two_factor_auth_enabled, :signature, :details, :notes, :role_type, :custom_role_id, :moderator, :ticket_restriction, :only_private_comments, 
  :restricted_agent, :suspended, :chat_only, :default_group_id, :user_fields

  def name 
  	object.name
  end

  def internal_id
    object.id
  end 

  def id 
  	object.zen_id
  end

  def email
  	object.email 
  end

  def created_at
  	object.created_at.strftime('%B %d, %Y')
  end

  def updated_at
  	object.updated_at.strftime('%B %d, %Y')
  end

  def time_zone
  	object.time_zone
  end

  def phone 
  	object.phone
  end

  def shared_phone_number 
  	object.shared_phone_number
  end

  def photo
  	object.photo
  end

  def locale_id
  	object.locale_id
  end

  def locale 
  	object.locale
  end

  def organization_id
  	object.organization_id
  end

  def role
  	object.role
  end

  def verified 
  	object.verified
  end

  def external_id
  	object.external_id
  end

  def tags 
  object.tags 
  end

  def alias
  object.alias
  end 

  def active
  object.active 
  end 

  def shared 
  object.shared 
  end 

  def shared_agent
  object.shared_agent
  end 

  def last_login_at
  object.last_login_at
  end 

  def two_factor_auth_enabled
  object.two_factor_auth_enabled
  end 

  def signature
  object.signature
  end

  def details 
  object.details
  end 

  def notes 
  object.notes 
  end 

  def role_type
  object.role_type
  end 

  def custom_role_id
  object.custom_role_id
  end 

  def moderator
  object.moderator
  end 

  def ticket_restriction
  object.ticket_restriction
  end 

  def only_private_comments
  object.only_private_comments
  end 

  def restricted_agent
  object.restricted_agent
  end 

  def suspended
  object.suspended
  end 

  def chat_only
  object.chat_only
  end 

  def default_group_id
  object.default_group_id
  end 

  def user_fields
  object.user_fields
  end 

   
end

class TicketSerializer < ActiveModel::Serializer
  attributes :id, :zen_id, :subject, :description, :status, :recipient, :sub_id, :req_id, :a_id, :g_id, :created_at, :external_id_string, :updated_at

  def internal_id
  	object.id
  end

  def id 
  	object.zen_id
  end

  def subject
  	object.subject
  end

  def description
  	object.description
  end

  def recipient 
  	object.recipient
  end

  def sub_id
  	object.sub_id
  end

  def req_id
  	object.req_id
  end

  def a_id
  	object.a_id
  end

  def g_id
  	object.g_id
  end

  def created_at
  	object.created_at
  end

  def external_id_string 
  	object.external_id_string
  end

  def updated_at
  	object.updated_at
  end


end

class TicketMetricSerializer < ActiveModel::Serializer
  attributes :id, :zen_id, :tick_id, :assignee_updated_at, :initially_assigned_at, :solved_at, :first_resolution_time_in_minutes,
   :full_resolution_time_in_minutes, :external_id_string, :created_at, :updated_at

  def internal_id
  	object.id
  end

  def id 
  	object.zen_id
  end

  def tick_id
  	object.tick_id
  end

  def assignee_updated_at
  	object.assignee_updated_at
  end

  def initially_assigned_at
  	object.initially_assigned_at
  end

  def solved_at
  	object.solved_at
  end

  def first_resolution_time_in_minutes
  	object.first_resolution_time_in_minutes
  end

  def full_resolution_time_in_minutes
  	object.full_resolution_time_in_minutes
  end

  def external_id_string
  	object.external_id_string
  end

  def created_at
  	object.created_at
  end

  def updated_at
  	object.updated_at
  end

end

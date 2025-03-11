class TaskSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :description, :completed, :completed_at, :due_date,
             :priority, :category, :recurring, :recurrence_frequency,
             :notes, :attachment_url, :status, :points_awarded, :created_at, :updated_at

  belongs_to :user, serializer: UserSerializer
end

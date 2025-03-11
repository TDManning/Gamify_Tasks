class TaskSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :description, :completed, :status, :priority, :points_awarded, :created_at, :updated_at

  belongs_to :user, serializer: UserSerializer
end

class UserSerializer
  include JSONAPI::Serializer

  attributes :email, :username, :created_at, :updated_at
end

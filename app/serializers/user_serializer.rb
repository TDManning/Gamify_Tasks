class UserSerializer
  include JSONAPI::Serializer

  attributes :email, :username

  attribute :created_at do |user|
    user.created_at&.iso8601
  end

  attribute :updated_at do |user|
    user.updated_at&.iso8601
  end
end

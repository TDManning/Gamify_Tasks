class UserService
  Result = Struct.new(:success?, :user, :token, :errors)

  def self.create_user(params)
    user = User.new(params)

    if user.save
      token = AuthService.encode(user_id: user.id)
      Result.new(true, user, token, nil)
    else
      Result.new(false, nil, nil, user.errors.full_messages)
    end
  end
end

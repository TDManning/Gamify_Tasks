class AuthService
  SECRET_KEY = Rails.application.credentials.jwt_secret

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY, 'HS256') 
  end

  def self.decode(token)
    body = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')[0]
    HashWithIndifferentAccess.new(body)
  rescue JWT::ExpiredSignature
    Rails.logger.error "Token has expired"
    nil
  rescue JWT::DecodeError => e
    Rails.logger.error "Failed to decode token: #{e.message}"
    nil
  end
end

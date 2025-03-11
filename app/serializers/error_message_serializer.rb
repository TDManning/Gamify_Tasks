class ErrorMessageSerializer
  def self.serialize(message, status)
    {
      errors: [
        {
          status: status.to_s,
          title: message
        }
      ]
    }
  end
end

class ErrorSerializer
  def self.serialize(errors, status)
    {
      errors: errors.map do |error|
        {
          status: status.to_s,
          title: error
        }
      end
    }
  end
end

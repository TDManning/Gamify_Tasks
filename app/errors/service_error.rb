class ServiceError < StandardError
  attr_reader :errors, :status

  def initialize(errors, status)
    @errors = Array(errors)
    @status = status
  end
end

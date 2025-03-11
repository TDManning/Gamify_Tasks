class TaskService
  def initialize(user)
    @user = user
  end

  def create(params)
    task = @user.tasks.new(params)
    if task.save
      task
    else
      raise ServiceError.new(task.errors.full_messages, 422)
    end
  end

  def update(task, params)
    if task.update(params)
      task
    else
      raise ServiceError.new(task.errors.full_messages, 422)
    end
  end

  def destroy(task)
    task.destroy!
  rescue ActiveRecord::RecordNotDestroyed => e
    raise ServiceError.new(e.record.errors.full_messages, 422)
  end
end

class TaskService
  def initialize(user)
    @user = user
  end

  def create(params)
    task = @user.tasks.new(params)
    if task.save
      task
    else
      raise ActiveRecord::RecordInvalid, task
    end
  end

  def update(task, params)
    if task.update(params)
      task
    else
      raise ActiveRecord::RecordInvalid, task
    end
  end

  def destroy(task)
    task.destroy!
  end
end

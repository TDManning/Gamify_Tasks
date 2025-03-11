class TaskQuery
  def self.for_user(user)
    Task.where(user: user)
  end

  def self.incomplete_for_user(user)
    Task.where(user: user, completed: false)
  end

  def self.high_priority_for_user(user)
    Task.where(user: user, priority: 'high')
  end

  def self.by_status_for_user(user, status)
    Task.where(user: user, status: status)
  end

  def self.find_for_user(user, id)
    user.tasks.find_by(id: id)
  end
end

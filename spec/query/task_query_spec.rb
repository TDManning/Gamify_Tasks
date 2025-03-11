require 'rails_helper'

RSpec.describe TaskQuery do
  let!(:user) { create(:user) }
  let!(:task) { create(:task, user: user, priority: 'high', status: 'pending') }
  let!(:completed_task) { create(:task, user: user, completed: true) }

  describe '.for_user' do
    it 'returns tasks for the user' do
      result = TaskQuery.for_user(user)
      expect(result).to include(task)
    end
  end

  describe '.incomplete_for_user' do
    it 'returns incomplete tasks' do
      result = TaskQuery.incomplete_for_user(user)
      expect(result).to include(task)
      expect(result).not_to include(completed_task)
    end
  end

  describe '.high_priority_for_user' do
    it 'returns high priority tasks' do
      result = TaskQuery.high_priority_for_user(user)
      expect(result).to include(task)
    end
  end

  describe '.by_status_for_user' do
    it 'returns tasks by status' do
      result = TaskQuery.by_status_for_user(user, 'pending')
      expect(result).to include(task)
    end
  end
end

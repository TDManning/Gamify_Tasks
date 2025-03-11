class Task < ApplicationRecord
  belongs_to :user

  VALID_STATUSES = %w[pending in_progress completed].freeze
  VALID_PRIORITIES = %w[low medium high].freeze

  before_validation :downcase_priority, :downcase_status

  validates :name, presence: true, uniqueness: { scope: :user_id, case_sensitive: false }
  validates :status, inclusion: { in: VALID_STATUSES }
  validates :priority, inclusion: { in: VALID_PRIORITIES }
  validates :points_awarded, numericality: { greater_than_or_equal_to: 0 }

  scope :incomplete, -> { where(completed: false) }

  private

  def downcase_status
    self.status = status.downcase if status.present?
  end

  def downcase_priority
    self.priority = priority.downcase if priority.present?
  end
end

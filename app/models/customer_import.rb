class CustomerImport < ApplicationRecord
  PENDING = "pending"
  PROCESSING = "processing"
  COMPLETE = "complete"
  ERROR = "error"
  STATUSES = [PENDING, PROCESSING, COMPLETE, ERROR]

  validates :status, presence: true, inclusion: { in: STATUSES }
  validate :file_attached

  has_one_attached :file

  def file_attached
    unless file.attached?
      errors.add(:file, "must be attached")
    end
  end
end

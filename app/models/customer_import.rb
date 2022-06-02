class CustomerImport < ApplicationRecord
  PENDING = "pending"
  PROCESSING = "processing"
  COMPLETE = "complete"
  STATUSES = [PENDING, PROCESSING, COMPLETE]

  validates :status, presence: true, inclusion: { in: STATUSES }
  validate :file_attached

  has_one_attached :file
  has_many :customers

  def process
    CustomerImport::ImporterJob.perform_later(id)
  end

  def processing!
    update(status: PROCESSING)
  end

  private

  def file_attached
    unless file.attached?
      errors.add(:file, "must be attached")
    end
  end
end

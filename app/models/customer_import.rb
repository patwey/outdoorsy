class CustomerImport < ApplicationRecord
  PENDING = "pending".freeze
  PROCESSING = "processing".freeze
  COMPLETE = "complete".freeze
  STATUSES = [PENDING, PROCESSING, COMPLETE].freeze

  validates :status, presence: true, inclusion: { in: STATUSES }
  validate :file_attached

  has_one_attached :file
  has_many :customers

  def process
    Import::ImporterJob.perform_later(id)
  end

  def processing!
    update(status: PROCESSING)
  end

  private

  def file_attached
    errors.add(:file, "must be attached") unless file.attached?
  end
end

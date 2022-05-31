class CustomerImport < ApplicationRecord
  STATUSES = %w(pending processing complete error)

  validates :status, presence: true, inclusion: { in: STATUSES }

  has_one_attached :file
end

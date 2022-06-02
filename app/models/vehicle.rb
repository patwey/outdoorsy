class Vehicle < ApplicationRecord
  BICYCLE = "bicycle".freeze
  CAMPERVAN = "campervan".freeze
  MOTORBOAT = "motorboat".freeze
  RV = "rv".freeze
  SAILBOAT = "sailboat".freeze

  KINDS = [BICYCLE, CAMPERVAN, MOTORBOAT, RV, SAILBOAT].freeze

  validates :name, presence: true, uniqueness: { scope: :customer_id, case_sensitive: false }
  validates :kind, presence: true, inclusion: { in: KINDS }
  validates :length, presence: true, numericality: { only_integer: true }

  belongs_to :customer
end

class Vehicle < ApplicationRecord
  BICYCLE = "bicycle"
  CAMPERVAN = "campervan"
  MOTORBOAT = "motorboat"
  RV = "rv"
  SAILBOAT = "sailboat"

  KINDS = [
    BICYCLE,
    CAMPERVAN,
    MOTORBOAT,
    RV,
    SAILBOAT,
  ]

  validates :name, presence: true, uniqueness: { scope: :customer_id, case_sensitive: false }
  validates :kind, presence: true, inclusion: { in: KINDS }
  validates :length, presence: true, numericality: { only_integer: true }

  belongs_to :customer
end

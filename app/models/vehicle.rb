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

  validates :name, presence: true
  validates :kind, presence: true, inclusion: { in: KINDS }
  validates :length, presence: true, numericality: { only_integer: true }

  belongs_to :customer
end

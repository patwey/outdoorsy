class Vehicle < ApplicationRecord
  TYPES = %w(sailboat motorboat rv bicycle)

  validates :name, presence: true
  validates :type, presence: true, inclusion: { in: TYPES }
  validates :length, presence: true, numericality: { only_integer: true }

  belongs_to :customer
end

class Customer < ApplicationRecord
  EMAIL_REGEX = %r{\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z}

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }

  has_many :vehicles
end

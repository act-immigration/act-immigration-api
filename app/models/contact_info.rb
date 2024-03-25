class ContactInfo < ApplicationRecord
  has_many :enquiries
  has_many :appointments
  # Validations
  validates :name, presence: true
  validates :surname, presence: true
  validates :phonenumber, presence: true
  validates :email, presence: true, uniqueness: true
end

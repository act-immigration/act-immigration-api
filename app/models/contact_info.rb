class ContactInfo < ApplicationRecord
    # Validations
  validates :name, presence: true
  validates :surname, presence: true
  validates :phonenumber, presence: true
  validates :email, presence: true, uniqueness: true
end

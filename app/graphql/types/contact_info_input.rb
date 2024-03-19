#  ContactInfoInput type
module Types
  class ContactInfoInput < BaseInputObject
    argument :name, String, required: true
    argument :surname, String, required: true
    argument :phonenumber, String, required: true
    argument :email, String, required: true
  end
end
# app/graphql/types/enquiry_type.rb
module Types
  class EnquiryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :surname, String, null: false
    field :phonenumber, String, null: false
    field :email, String, null: false
    field :gender, String, null: true
    field :dob, String, null: true
    field :marital_status, String, null: true
    field :residential_address, String, null: true
    field :immigration_status, String, null: true
    field :entry_date, String, null: true
    field :passport_number, String, null: true
    field :reference_number, String, null: true
    field :service_type, String, null: false
    field :elaborate, String, null: true
  end
end

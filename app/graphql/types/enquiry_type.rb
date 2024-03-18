module Types
  class EnquiryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :surname, String, null: false
    field :phonenumber, String, null: false
    field :email, String, null: false
    field :gender, String, null: false
    field :dob, GraphQL::Types::ISO8601Date, null: false
    field :marital_status, String, null: false
    field :residential_address, String, null: false
    field :immigration_status, String, null: false
    field :entry_date, GraphQL::Types::ISO8601Date, null: false
    field :passport_number, String, null: false
    field :reference_number, String, null: false
    field :service_type, String, null: false
    field :elaborate, String, null: false
    field :contact_info_id, ID, null: false
  end
end

module Types
  class EnquiryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :surname, String, null: false
    field :phonenumber, String, null: false
    field :email, String, null: false
    field :gender, String, null: false
    field :dob, GraphQL::Types::ISO8601Date, null: false
    field :maritalStatus, String, null: false
    field :residentialAddress, String, null: false
    field :immigrationStatus, String, null: false
    field :entryDate, GraphQL::Types::ISO8601Date, null: false
    field :passportNumber, String, null: false
    field :referenceNumber, String, null: false
    field :serviceType, String, null: false
    field :elaborate, String, null: false
  end
end

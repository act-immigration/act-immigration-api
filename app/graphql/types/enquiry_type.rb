# frozen_string_literal: true

module Types
  class EnquiryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :surname, String
    field :phonenumber, String
    field :email, String
    field :gender, String
    field :dob, GraphQL::Types::ISO8601Date
    field :maritalStatus, String
    field :residentialAddress, String
    field :immigrationStatus, String
    field :entryDate, GraphQL::Types::ISO8601Date
    field :passportNumber, String
    field :referenceNumber, String
    field :serviceType, String
    field :elaborate, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :contact_info_id, Integer, null: false
  end
end

# frozen_string_literal: true

module Types
  class ContactInfoType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :surname, String
    field :phonenumber, String
    field :email, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

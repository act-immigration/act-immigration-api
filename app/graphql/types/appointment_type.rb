# app/graphql/types/appointment_type.rb
module Types
  class AppointmentType < Types::BaseObject
    field :id, ID, null: false
    field :appointment_date, String, null: false
    field :service_type, String, null: false
    field :venue, String, null: false
    field :elaborate, String, null: true
  end
end

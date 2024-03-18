# app/graphql/types/appointment_type.rb
module Types
  class AppointmentType < Types::BaseObject
    field :id, ID, null: false
    field :appointmentDate, String, null: false
    field :serviceType, String, null: false
    field :venue, String, null: false
    field :elaborate, String, null: true
  end
end

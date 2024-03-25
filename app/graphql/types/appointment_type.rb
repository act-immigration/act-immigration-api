# app/graphql/types/appointment_type.rb
module Types
  class AppointmentType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :surname, String, null: false
    field :phonenumber, String, null: false
    field :email, String, null: false
    field :appointmentDate, String, null: false
    field :appointmentType, String, null: false
    field :serviceType, String, null: false
    field :venue, String, null: false
  end
end

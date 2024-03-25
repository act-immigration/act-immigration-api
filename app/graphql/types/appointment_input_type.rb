module Types
  class AppointmentInputType < Types::BaseInputObject
    argument :name, String, required: true
    argument :surname, String, required: true
    argument :phonenumber, String, required: true
    argument :email, String, required: true
    argument :appointmentDate, String, required: true
    argument :appointmentType, String, required: true
    argument :serviceType, String, required: true
    argument :venue, String, required: true
  end
end

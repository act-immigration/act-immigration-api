# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# seeds.rb

# seeds.rb

# seeds.rb

# seeds.rb

# Create some contact infos
john_contact_info = ContactInfo.create!(
  name: "John",
  surname: "Doe",
  phonenumber: "1234567890",
  email: "john.doe@example.com"
)

jane_contact_info = ContactInfo.create!(
  name: "Jane",
  surname: "Smith",
  phonenumber: "0987654321",
  email: "jane.smith@gmail.com"
)

# Create some enquiries
Enquiry.create!(
  name: "John",
  surname: "Doe",
  phonenumber: "1234567890",
  email: "john.doe@example.com",
  gender: "Male",
  dob: Date.new(1990, 1, 1),
  marital_status: "Single",
  residential_address: "123 Main St, City",
  immigration_status: "Citizen",
  entry_date: Date.new(2022, 1, 1),
  passport_number: "AB123456",
  reference_number: "REF123",
  service_type: "Legal",
  elaborate: "Need legal advice",
  contact_info: john_contact_info
)

Enquiry.create!(
  name: "Jane",
  surname: "Smith",
  phonenumber: "0987654321",
  email: "jane.smith@gmail.com",
  gender: "Female",
  dob: Date.new(1985, 5, 10),
  marital_status: "Married",
  residential_address: "456 Oak St, Town",
  immigration_status: "Permanent Resident",
  entry_date: Date.new(2020, 6, 15),
  passport_number: "CD987654",
  reference_number: "REF456",
  service_type: "Immigration",
  elaborate: "Need help with immigration process",
  contact_info: jane_contact_info
)

Appointment.create!(
  appointment_date: DateTime.new(2024, 3, 15, 10, 0, 0),
  service_type: "Legal",
  venue: "Law Firm",
  elaborate: "Meeting to discuss legal matters",
  contact_info: john_contact_info
)

Appointment.create!(
  appointment_date: DateTime.new(2024, 3, 20, 14, 0, 0),
  service_type: "Consultation",
  venue: "Consultancy Office",
  elaborate: "Consultation session for immigration process",
  contact_info: jane_contact_info
)

module Mutations
  class CreateEnquiry < BaseMutation
    argument :name, String, required: true
    argument :surname, String, required: true
    argument :phonenumber, String, required: true
    argument :email, String, required: true
    argument :gender, String, required: true
    argument :dob, GraphQL::Types::ISO8601Date, required: true
    argument :marital_status, String, required: true
    argument :residential_address, String, required: true
    argument :immigration_status, String, required: true
    argument :entry_date, GraphQL::Types::ISO8601Date, required: true
    argument :passport_number, String, required: true
    argument :reference_number, String, required: true
    argument :service_type, String, required: true
    argument :elaborate, String, required: true
    argument :contact_info_id, ID, required: true

    field :enquiry, Types::EnquiryType, null: false

    def resolve(name:, surname:, phonenumber:, email:, gender:, dob:, marital_status:, residential_address:, immigration_status:, entry_date:, passport_number:, reference_number:, service_type:, elaborate:, contact_info_id:)
      enquiry = Enquiry.new(
        name: name,
        surname: surname,
        phonenumber: phonenumber,
        email: email,
        gender: gender,
        dob: dob,
        marital_status: marital_status,
        residential_address: residential_address,
        immigration_status: immigration_status,
        entry_date: entry_date,
        passport_number: passport_number,
        reference_number: reference_number,
        service_type: service_type,
        elaborate: elaborate,
        contact_info_id: contact_info_id
      )

      if enquiry.save
        { enquiry: enquiry }
      else
        { errors: enquiry.errors.full_messages }
      end
    end
  end
end

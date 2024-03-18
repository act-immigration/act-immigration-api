module Types
  class EnquiryInputType < Types::BaseInputObject
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
    argument :documentUpload, [Types::FileType], required: false
  end
end

module Types
  class EnquiryInput < Types::BaseInputObject
    argument :name, String, required: true
    argument :surname, String, required: true
    argument :phonenumber, String, required: true
    argument :email, String, required: true
    argument :gender, String, required: true
    argument :dob, String, required: true
    argument :maritalStatus, String, required: true
    argument :residentialAddress, String, required: true
    argument :immigrationStatus, String, required: true
    argument :entryDate, String, required: true
    argument :passportNumber, String, required: false
    argument :referenceNumber, String, required: true
    argument :serviceType, String, required: true
    argument :elaborate, String, required: true
    argument :contact_info_id, ID, required: false
    argument :contact_info_email, String, required: false
    argument :contact_info, Types::ContactInfoInput, required: false
  end
end

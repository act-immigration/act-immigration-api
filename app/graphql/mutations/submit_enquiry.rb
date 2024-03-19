module Mutations
  class SubmitEnquiry < BaseMutation
    argument :input, Types::EnquiryInput, required: true

    field :enquiry, Types::EnquiryType, null: false

    def resolve(input:)
      contact_info_input = input[:contact_info].to_h
      contact_info = ContactInfo.find_or_create_by(email: contact_info_input[:email]) do |ci|
        ci.name = contact_info_input[:name]
        ci.surname = contact_info_input[:surname]
        ci.phonenumber = contact_info_input[:phonenumber]
      end

      input_hash = input.to_h
      enquiry = Enquiry.new(input_hash.except(:contact_info).merge(contact_info:))

      raise GraphQL::ExecutionError, enquiry.errors.full_messages.join(", ") unless enquiry.save

      { enquiry: }
    end
  end
end

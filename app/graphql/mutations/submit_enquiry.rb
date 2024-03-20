module Mutations
  class SubmitEnquiry < BaseMutation
    argument :input, Types::EnquiryInput, required: false

    field :enquiry, Types::EnquiryType, null: false

    def resolve(input:)
      # Extract contact info from input
      contact_info_input = input[:contact_info].to_h
      contact_info = ContactInfo.find_or_create_by(email: contact_info_input[:email]) do |ci|
        ci.name = contact_info_input[:name]
        ci.surname = contact_info_input[:surname]
        ci.phonenumber = contact_info_input[:phonenumber]
      end

      # Build Enquiry object with merged attributes
      enquiry = Enquiry.new(
        input.to_h.except(:contact_info).merge(contact_info: contact_info)
      )

      # Validate and save Enquiry object
      if enquiry.save
        { enquiry: enquiry }
      else
        raise GraphQL::ExecutionError, enquiry.errors.full_messages.join(", ")
      end
    end
  end
end

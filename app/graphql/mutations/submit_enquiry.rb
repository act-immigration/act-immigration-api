module Mutations
  class SubmitEnquiry < BaseMutation
    argument :input, Types::EnquiryInput, required: true

    field :enquiry, Types::EnquiryType, null: false

    def resolve(input:)
      enquiry = Enquiry.new(input.to_h)

      if enquiry.save
        { enquiry: enquiry }
      else
        { errors: enquiry.errors.full_messages }
      end
    end
  end
end

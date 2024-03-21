# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :submit_enquiry, mutation: Mutations::SubmitEnquiry
  end
end

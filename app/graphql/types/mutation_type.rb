# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :submit_enquiry, mutation: Mutations::SubmitEnquiry
    field :create_user, mutation: Mutations::CreateUser
    field :signin_user, mutation: Mutations::SignInUser
  end
end

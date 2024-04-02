module Mutations
  class CreateUser < BaseMutation
    argument :input, Types::CreateUserInput, required: true

    type Types::UserType

    def resolve(input:)
      User.create!(
        email: input.email,
        password: input.password
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end

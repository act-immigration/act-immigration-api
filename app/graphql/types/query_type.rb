# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Fetches an object given its ID.
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    # Fetches a list of objects given a list of IDs.
    field :nodes, [Types::NodeType, { null: true }], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Fetch all appointments
    field :appointments, [Types::AppointmentType], null: true, description: "Fetch all appointments"

    def appointments
      Appointment.all
    end

    # Fetch all enquiries
    field :enquiries, [Types::EnquiryType], null: true, description: "Fetch all enquiries"

    def enquiries
      Enquiry.all
    end
  end
end

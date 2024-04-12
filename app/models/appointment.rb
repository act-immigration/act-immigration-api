class Appointment < ApplicationRecord
  belongs_to :contact_info
  has_many :documents, as: :documentable
end

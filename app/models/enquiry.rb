class Enquiry < ApplicationRecord
  belongs_to :contact_info
  has_one_attached :document_upload
  has_many :documents, as: :documentable
end
